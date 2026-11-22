import 'dotenv/config';
import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import rateLimit from 'express-rate-limit';
import argon2 from 'argon2';
import jwt from 'jsonwebtoken';
import { randomUUID } from 'node:crypto';
import { PrismaClient, ProductStatus, UserRole } from '@prisma/client';
import { z } from 'zod';

const required = ['DATABASE_URL', 'JWT_SECRET'];
for (const key of required) if (!process.env[key]) throw new Error(`Missing required environment variable: ${key}`);
if (process.env.JWT_SECRET.length < 32) throw new Error('JWT_SECRET must contain at least 32 characters');

const prisma = new PrismaClient();
const app = express();
app.disable('x-powered-by');
app.use(helmet());
const allowedOrigins = (process.env.CORS_ORIGINS || '').split(',').map(x => x.trim()).filter(Boolean);
app.use(cors({ origin(origin, cb) { if (!origin || allowedOrigins.includes(origin)) return cb(null, true); return cb(new Error('Origin not allowed')); }, credentials: false }));
app.use(express.json({ limit: '1mb' }));
app.use(rateLimit({ windowMs: 60_000, limit: 120, standardHeaders: 'draft-8', legacyHeaders: false }));
const authLimiter = rateLimit({ windowMs: 15 * 60_000, limit: 12, standardHeaders: 'draft-8', legacyHeaders: false });
const fail = (res, status, code, message) => res.status(status).json({ error: { code, message } });
const normalizeIdentifier = value => value.trim().toLowerCase();
const tokenFor = user => jwt.sign({ sub: user.id, role: user.role }, process.env.JWT_SECRET, { expiresIn: '12h', issuer: 'amoot-machine-api', audience: 'amoot-machine-web' });
const auth = async (req, res, next) => {
  try {
    const raw = req.headers.authorization || '';
    if (!raw.startsWith('Bearer ')) return fail(res, 401, 'UNAUTHORIZED', 'ابتدا وارد حساب کاربری شوید.');
    const claims = jwt.verify(raw.slice(7), process.env.JWT_SECRET, { issuer: 'amoot-machine-api', audience: 'amoot-machine-web' });
    const user = await prisma.user.findUnique({ where: { id: claims.sub } });
    if (!user?.isActive) return fail(res, 401, 'UNAUTHORIZED', 'نشست معتبر نیست.');
    req.user = user; next();
  } catch { return fail(res, 401, 'UNAUTHORIZED', 'توکن نامعتبر یا منقضی شده است.'); }
};
const admin = (req, res, next) => req.user?.role === UserRole.ADMIN || req.user?.role === UserRole.OPERATOR ? next() : fail(res, 403, 'FORBIDDEN', 'دسترسی مجاز نیست.');
const registerSchema = z.object({ identifier: z.string().trim().min(5).max(190), displayName: z.string().trim().min(2).max(100), password: z.string().min(10).max(128) });
const loginSchema = z.object({ identifier: z.string().trim().min(5).max(190), password: z.string().min(1).max(128) });
const orderSchema = z.object({
  items: z.array(z.object({ sku: z.string().trim().min(1).max(80), quantity: z.number().int().min(1).max(100) })).min(1).max(40),
  shipping: z.object({ recipient: z.string().trim().min(2).max(100), phone: z.string().trim().min(8).max(20), province: z.string().trim().min(2).max(80), city: z.string().trim().min(2).max(80), postalCode: z.string().trim().max(20).optional(), addressLine: z.string().trim().min(8).max(1000), notes: z.string().trim().max(1000).optional() })
});
const quoteSchema = z.object({ name: z.string().trim().min(2).max(100), phone: z.string().trim().min(8).max(20), productSku: z.string().trim().max(80).optional(), machineModel: z.string().trim().max(120).optional(), message: z.string().trim().min(5).max(2000) });
const productDto = p => ({ ...p, priceIrr: p.priceIrr === null ? null : p.priceIrr.toString() });
const orderDto = o => ({ ...o, totalIrr: o.totalIrr.toString(), items: o.items?.map(i => ({ ...i, unitPriceIrr: i.unitPriceIrr.toString(), lineTotalIrr: i.lineTotalIrr.toString() })) });

app.get('/api/health', async (_req, res) => {
  try { await prisma.$queryRaw`SELECT 1`; res.json({ ok: true, service: 'amoot-machine-api', database: 'connected' }); }
  catch { fail(res, 503, 'DATABASE_UNAVAILABLE', 'پایگاه داده در دسترس نیست.'); }
});
app.post('/api/auth/register', authLimiter, async (req, res) => {
  const parsed = registerSchema.safeParse(req.body); if (!parsed.success) return fail(res, 400, 'VALIDATION_ERROR', 'اطلاعات ثبت‌نام معتبر نیست.');
  const identifier = normalizeIdentifier(parsed.data.identifier);
  try {
    const passwordHash = await argon2.hash(parsed.data.password, { type: argon2.argon2id });
    const user = await prisma.user.create({ data: { identifier, displayName: parsed.data.displayName, passwordHash } });
    res.status(201).json({ token: tokenFor(user), user: { id: user.id, identifier: user.identifier, displayName: user.displayName, role: user.role } });
  } catch (e) { if (e.code === 'P2002') return fail(res, 409, 'IDENTIFIER_EXISTS', 'این شماره یا ایمیل قبلاً ثبت شده است.'); throw e; }
});
app.post('/api/auth/login', authLimiter, async (req, res) => {
  const parsed = loginSchema.safeParse(req.body); if (!parsed.success) return fail(res, 400, 'VALIDATION_ERROR', 'اطلاعات ورود معتبر نیست.');
  const user = await prisma.user.findUnique({ where: { identifier: normalizeIdentifier(parsed.data.identifier) } });
  if (!user?.isActive || !(await argon2.verify(user.passwordHash, parsed.data.password))) return fail(res, 401, 'INVALID_CREDENTIALS', 'شماره/ایمیل یا رمز عبور صحیح نیست.');
  res.json({ token: tokenFor(user), user: { id: user.id, identifier: user.identifier, displayName: user.displayName, role: user.role } });
});
app.get('/api/me', auth, (req, res) => res.json({ id: req.user.id, identifier: req.user.identifier, displayName: req.user.displayName, role: req.user.role }));
app.get('/api/products', async (req, res) => {
  const q = String(req.query.q || '').trim().slice(0, 100), category = String(req.query.category || '').slice(0, 100), brand = String(req.query.brand || '').slice(0, 100), model = String(req.query.model || '').slice(0, 120);
  const rows = await prisma.product.findMany({ where: { status: ProductStatus.ACTIVE, ...(category && { category }), ...(brand && { brand }), ...(model && { machineModel: model }), ...(q && { OR: [{ name: { contains: q, mode: 'insensitive' } }, { sku: { contains: q, mode: 'insensitive' } }, { brand: { contains: q, mode: 'insensitive' } }, { machineModel: { contains: q, mode: 'insensitive' } }] }) }, orderBy: { createdAt: 'desc' }, take: 100 });
  res.json({ items: rows.map(productDto) });
});
app.get('/api/products/:sku', async (req, res) => {
  const p = await prisma.product.findUnique({ where: { sku: req.params.sku } });
  if (!p || p.status !== ProductStatus.ACTIVE) return fail(res, 404, 'NOT_FOUND', 'محصول پیدا نشد.');
  res.json(productDto(p));
});
app.post('/api/orders', auth, async (req, res) => {
  const parsed = orderSchema.safeParse(req.body); if (!parsed.success) return fail(res, 400, 'VALIDATION_ERROR', 'اطلاعات سفارش معتبر نیست.');
  const idempotencyKey = String(req.headers['idempotency-key'] || '').trim();
  if (idempotencyKey.length < 8 || idempotencyKey.length > 120) return fail(res, 400, 'IDEMPOTENCY_KEY_REQUIRED', 'کلید یکتای درخواست معتبر نیست.');
  try {
    const order = await prisma.$transaction(async tx => {
      const existing = await tx.order.findUnique({ where: { idempotencyKey }, include: { items: true } });
      if (existing) { if (existing.userId !== req.user.id) throw Object.assign(new Error('IDEMPOTENCY_CONFLICT'), { code: 'IDEMPOTENCY_CONFLICT' }); return existing; }
      const requested = parsed.data.items;
      const skus = [...new Set(requested.map(x => x.sku))];
      const products = await tx.product.findMany({ where: { sku: { in: skus }, status: ProductStatus.ACTIVE } });
      if (products.length !== skus.length) throw Object.assign(new Error('PRODUCT_NOT_FOUND'), { code: 'PRODUCT_NOT_FOUND' });
      const bySku = new Map(products.map(p => [p.sku, p]));
      let total = 0n; const snapshots = [];
      for (const item of requested) {
        const p = bySku.get(item.sku);
        if (p.priceIrr === null || p.priceIrr <= 0n) throw Object.assign(new Error('QUOTE_REQUIRED'), { code: 'QUOTE_REQUIRED' });
        if (p.stock < item.quantity) throw Object.assign(new Error('OUT_OF_STOCK'), { code: 'OUT_OF_STOCK' });
        const line = p.priceIrr * BigInt(item.quantity); total += line;
        snapshots.push({ productId: p.id, skuSnapshot: p.sku, nameSnapshot: p.name, quantity: item.quantity, unitPriceIrr: p.priceIrr, lineTotalIrr: line });
      }
      for (const item of requested) {
        const changed = await tx.product.updateMany({ where: { sku: item.sku, status: ProductStatus.ACTIVE, stock: { gte: item.quantity } }, data: { stock: { decrement: item.quantity } } });
        if (changed.count !== 1) throw Object.assign(new Error('OUT_OF_STOCK'), { code: 'OUT_OF_STOCK' });
      }
      return tx.order.create({ data: { orderNumber: 'AM-' + randomUUID().replaceAll('-', '').slice(0, 10).toUpperCase(), idempotencyKey, userId: req.user.id, totalIrr: total, ...parsed.data.shipping, items: { create: snapshots } }, include: { items: true } });
    }, { isolationLevel: 'Serializable' });
    res.status(201).json({ order: orderDto(order) });
  } catch (e) {
    const errors = { IDEMPOTENCY_CONFLICT: [409, 'کلید درخواست قبلاً برای حساب دیگری استفاده شده است.'], PRODUCT_NOT_FOUND: [404, 'یکی از محصولات دیگر موجود نیست.'], QUOTE_REQUIRED: [409, 'برای یکی از کالاها ابتدا باید استعلام قیمت ثبت شود.'], OUT_OF_STOCK: [409, 'موجودی یکی از کالاها کافی نیست.'] };
    if (errors[e.code]) return fail(res, ...[errors[e.code][0], e.code, errors[e.code][1]]);
    if (e.code === 'P2034') return fail(res, 409, 'RETRY_ORDER', 'تداخل هم‌زمانی رخ داد؛ درخواست را با همان کلید دوباره ارسال کنید.');
    if (e.code === 'P2002') { const existing = await prisma.order.findUnique({ where: { idempotencyKey }, include: { items: true } }); if (existing?.userId === req.user.id) return res.status(200).json({ order: orderDto(existing), replayed: true }); }
    throw e;
  }
});
app.get('/api/orders', auth, async (req, res) => {
  const items = await prisma.order.findMany({ where: { userId: req.user.id }, include: { items: true }, orderBy: { createdAt: 'desc' }, take: 100 });
  res.json({ items: items.map(orderDto) });
});
app.get('/api/orders/:orderNumber', auth, async (req, res) => {
  const order = await prisma.order.findFirst({ where: { orderNumber: req.params.orderNumber, userId: req.user.id }, include: { items: true } });
  if (!order) return fail(res, 404, 'NOT_FOUND', 'سفارش پیدا نشد.');
  res.json({ order: orderDto(order) });
});
app.post('/api/quotes', async (req, res) => {
  const parsed = quoteSchema.safeParse(req.body); if (!parsed.success) return fail(res, 400, 'VALIDATION_ERROR', 'اطلاعات استعلام معتبر نیست.');
  const quote = await prisma.quote.create({ data: { quoteNumber: 'AQ-' + randomUUID().replaceAll('-', '').slice(0, 10).toUpperCase(), ...parsed.data } });
  res.status(201).json({ quote: { quoteNumber: quote.quoteNumber, status: quote.status, createdAt: quote.createdAt } });
});
app.get('/api/admin/orders', auth, admin, async (_req, res) => {
  const items = await prisma.order.findMany({ include: { user: { select: { displayName: true, identifier: true } }, items: true }, orderBy: { createdAt: 'desc' }, take: 200 });
  res.json({ items: items.map(o => ({ ...orderDto(o), user: o.user })) });
});
app.patch('/api/admin/orders/:orderNumber/status', auth, admin, async (req, res) => {
  const parsed = z.object({ status: z.enum(['PENDING','CONFIRMED','PROCESSING','SHIPPED','DELIVERED','CANCELLED']) }).safeParse(req.body);
  if (!parsed.success) return fail(res, 400, 'VALIDATION_ERROR', 'وضعیت سفارش معتبر نیست.');
  const order = await prisma.order.update({ where: { orderNumber: req.params.orderNumber }, data: { status: parsed.data.status }, include: { items: true } }).catch(() => null);
  if (!order) return fail(res, 404, 'NOT_FOUND', 'سفارش پیدا نشد.');
  res.json({ order: orderDto(order) });
});
app.use((err, _req, res, _next) => { console.error(err); res.status(500).json({ error: { code: 'INTERNAL_ERROR', message: 'خطای داخلی سرور رخ داد.' } }); });
const port = Number(process.env.PORT || 4000), host = process.env.HOST || '127.0.0.1';
const server = app.listen(port, host, () => console.log(`Amoot API listening on http://${host}:${port}`));
async function shutdown() { server.close(async () => { await prisma.$disconnect(); process.exit(0); }); }
process.on('SIGINT', shutdown); process.on('SIGTERM', shutdown);
