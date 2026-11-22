import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const url = Deno.env.get("SUPABASE_URL")!;
const anonKey = Deno.env.get("SUPABASE_ANON_KEY")!;
const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const adminDb = createClient(url, serviceKey, { auth: { persistSession: false } });
const cors = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type, idempotency-key",
  "Access-Control-Allow-Methods": "GET, POST, PATCH, OPTIONS",
  "Content-Type": "application/json; charset=utf-8",
};
const json = (data: unknown, status = 200) => new Response(JSON.stringify(data), { status, headers: cors });
const fail = (status: number, code: string, message: string) => json({ error: { code, message } }, status);
const clean = (v: unknown, max = 200) => String(v ?? "").trim().slice(0, max);
const userDto = (u: any) => ({ id: u.id, identifier: u.identifier, displayName: u.display_name, role: u.role });

Deno.serve(async (req) => {
  if (req.method === "OPTIONS") return new Response("ok", { headers: cors });
  const path = new URL(req.url).pathname.replace(/^\/store-api/, "").replace(/^\/functions\/v1\/store-api/, "") || "/";
  try {
    if (req.method === "POST" && path === "/api/auth/register") {
      const body = await req.json();
      const identifier = clean(body.identifier, 190).toLowerCase();
      const password = String(body.password ?? "");
      const displayName = clean(body.displayName, 100);
      if (identifier.length < 5 || password.length < 10 || password.length > 128 || displayName.length < 2)
        return fail(400, "VALIDATION_ERROR", "اطلاعات ثبت‌نام معتبر نیست.");
      const isEmail = identifier.includes("@");
      const credentials = isEmail ? { email: identifier, password } : { phone: identifier, password };
      const { data, error } = await adminDb.auth.signUp({ ...credentials, options: { data: { display_name: displayName, identifier } } });
      if (error) return fail(400, "REGISTER_FAILED", error.message);
      if (!data.session) return fail(403, "CONFIRMATION_REQUIRED", "حساب ساخته شد؛ ابتدا تأیید حساب را از پیام ارسال‌شده انجام دهید و سپس وارد شوید.");
      const { data: profile } = await adminDb.from("profiles").select("*").eq("id", data.user.id).single();
      return json({ token: data.session.access_token, user: userDto(profile ?? { id: data.user.id, identifier, display_name: displayName, role: "CUSTOMER" }) }, 201);
    }

    if (req.method === "POST" && path === "/api/auth/login") {
      const body = await req.json();
      const identifier = clean(body.identifier, 190).toLowerCase();
      const password = String(body.password ?? "");
      const credentials = identifier.includes("@") ? { email: identifier, password } : { phone: identifier, password };
      const { data, error } = await adminDb.auth.signInWithPassword(credentials);
      if (error || !data.user || !data.session) return fail(401, "INVALID_CREDENTIALS", "شماره/ایمیل یا رمز عبور صحیح نیست.");
      const { data: profile } = await adminDb.from("profiles").select("*").eq("id", data.user.id).single();
      if (!profile?.is_active) return fail(403, "ACCOUNT_DISABLED", "این حساب غیرفعال است.");
      return json({ token: data.session.access_token, user: userDto(profile) });
    }

    const authHeader = req.headers.get("Authorization") ?? "";
    if (!authHeader.startsWith("Bearer ")) return fail(401, "UNAUTHORIZED", "ابتدا وارد حساب کاربری شوید.");
    const userClient = createClient(url, anonKey, { global: { headers: { Authorization: authHeader } }, auth: { persistSession: false } });
    const { data: authData, error: authError } = await userClient.auth.getUser();
    if (authError || !authData.user) return fail(401, "UNAUTHORIZED", "نشست معتبر نیست.");
    const { data: profile } = await adminDb.from("profiles").select("*").eq("id", authData.user.id).single();
    if (!profile?.is_active) return fail(403, "ACCOUNT_DISABLED", "این حساب غیرفعال است.");
    const isAdmin = ["ADMIN", "OPERATOR"].includes(profile.role);

    if (req.method === "GET" && path === "/api/me")
      return json(userDto(profile));

    if (req.method === "GET" && path === "/api/products") {
      const u = new URL(req.url), q = clean(u.searchParams.get("q"), 100), category = clean(u.searchParams.get("category"), 100), brand = clean(u.searchParams.get("brand"), 100), model = clean(u.searchParams.get("model"), 120);
      let query = adminDb.from("products").select("*").eq("status", "ACTIVE").order("created_at", { ascending: false }).limit(100);
      if (category) query = query.eq("category", category);
      if (brand) query = query.eq("brand", brand);
      if (model) query = query.eq("machine_model", model);
      if (q) query = query.or(`name.ilike.%${q}%,sku.ilike.%${q}%,brand.ilike.%${q}%,machine_model.ilike.%${q}%`);
      const { data, error } = await query;
      if (error) return fail(500, "PRODUCTS_FAILED", "دریافت محصولات ناموفق بود.");
      return json({ items: (data ?? []).map(p => ({ id: p.id, sku: p.sku, name: p.name, brand: p.brand, category: p.category, machineModel: p.machine_model, description: p.description, imageUrl: p.image_url, priceIrr: p.price_irr == null ? null : String(p.price_irr), stock: p.stock })) });
    }

    if (req.method === "GET" && path === "/api/orders") {
      const { data, error } = await adminDb.from("orders").select("*, order_items(*)").eq("user_id", profile.id).order("created_at", { ascending: false }).limit(100);
      if (error) return fail(500, "ORDERS_FAILED", "دریافت سفارش‌ها ناموفق بود.");
      return json({ items: (data ?? []).map(o => ({ orderNumber: o.order_number, status: o.status, totalIrr: String(o.total_irr), createdAt: o.created_at, items: o.order_items.map((i: any) => ({ nameSnapshot: i.name_snapshot, quantity: i.quantity, unitPriceIrr: String(i.unit_price_irr), lineTotalIrr: String(i.line_total_irr) })) })) });
    }

    if (req.method === "POST" && path === "/api/orders") {
      const body = await req.json(), key = clean(req.headers.get("Idempotency-Key"), 120);
      if (key.length < 8 || !Array.isArray(body.items) || !body.items.length || body.items.length > 40)
        return fail(400, "VALIDATION_ERROR", "اطلاعات سفارش یا کلید یکتای درخواست معتبر نیست.");
      const items = body.items.map((i: any) => ({ sku: clean(i.sku, 80), quantity: Number(i.quantity) }));
      if (items.some((i: any) => !i.sku || !Number.isInteger(i.quantity) || i.quantity < 1 || i.quantity > 100))
        return fail(400, "VALIDATION_ERROR", "اقلام سفارش معتبر نیستند.");
      const s = body.shipping ?? {};
      const shipping = { recipient: clean(s.recipient,100), phone: clean(s.phone,20), province: clean(s.province,80), city: clean(s.city,80), postalCode: clean(s.postalCode,20), addressLine: clean(s.addressLine,1000), notes: clean(s.notes,1000) };
      if (shipping.recipient.length < 2 || shipping.phone.length < 8 || shipping.province.length < 2 || shipping.city.length < 2 || shipping.addressLine.length < 8)
        return fail(400, "VALIDATION_ERROR", "اطلاعات تحویل سفارش کامل نیست.");
      const { data, error } = await adminDb.rpc("amoot_create_order", { p_user_id: profile.id, p_idempotency_key: key, p_items: items, p_shipping: shipping });
      if (error) {
        const msg = error.message ?? "";
        if (msg.includes("IDEMPOTENCY_CONFLICT")) return fail(409, "IDEMPOTENCY_CONFLICT", "کلید درخواست قبلاً برای سفارش دیگری استفاده شده است.");
        if (msg.includes("PRODUCT_NOT_FOUND")) return fail(404, "PRODUCT_NOT_FOUND", "یکی از محصولات دیگر موجود نیست.");
        if (msg.includes("QUOTE_REQUIRED")) return fail(409, "QUOTE_REQUIRED", "برای یکی از کالاها ابتدا باید استعلام قیمت ثبت شود.");
        if (msg.includes("OUT_OF_STOCK")) return fail(409, "OUT_OF_STOCK", "موجودی یکی از کالاها کافی نیست.");
        return fail(500, "ORDER_FAILED", "ثبت سفارش ناموفق بود.");
      }
      return json({ order: { orderNumber: data.order_number, totalIrr: String(data.total_irr), status: data.status, createdAt: data.created_at } }, 201);
    }

    if (req.method === "POST" && path === "/api/quotes") {
      const body = await req.json(), name = clean(body.name,100), phone = clean(body.phone,20), message = clean(body.message,2000);
      if (name.length < 2 || phone.length < 8 || message.length < 5) return fail(400, "VALIDATION_ERROR", "اطلاعات استعلام معتبر نیست.");
      const { data, error } = await adminDb.from("quotes").insert({ quote_number: "AQ-" + crypto.randomUUID().replaceAll("-","").slice(0,10).toUpperCase(), user_id: authData.user.id, name, phone, message, product_sku: clean(body.productSku,80) || null }).select("quote_number,status,created_at").single();
      if (error) return fail(500, "QUOTE_FAILED", "ثبت استعلام ناموفق بود.");
      return json({ quote: { quoteNumber: data.quote_number, status: data.status, createdAt: data.created_at } }, 201);
    }

    if (req.method === "GET" && path === "/api/admin/orders") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const { data, error } = await adminDb.from("orders").select("*, profiles(display_name,identifier), order_items(*)").order("created_at", { ascending: false }).limit(200);
      if (error) return fail(500, "ADMIN_ORDERS_FAILED", "دریافت سفارش‌ها ناموفق بود.");
      return json({ items: (data ?? []).map(o => ({ orderNumber:o.order_number, totalIrr:String(o.total_irr), status:o.status, createdAt:o.created_at, user:{displayName:o.profiles?.display_name,identifier:o.profiles?.identifier} })) });
    }

    const statusMatch = path.match(/^\/api\/admin\/orders\/([^/]+)\/status$/);
    if (req.method === "PATCH" && statusMatch) {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const status = clean((await req.json()).status,30);
      if (!["PENDING","CONFIRMED","PROCESSING","SHIPPED","DELIVERED","CANCELLED"].includes(status)) return fail(400,"VALIDATION_ERROR","وضعیت سفارش معتبر نیست.");
      const { data, error } = await adminDb.from("orders").update({status}).eq("order_number",decodeURIComponent(statusMatch[1])).select("order_number,status,total_irr").single();
      if (error || !data) return fail(404,"NOT_FOUND","سفارش پیدا نشد.");
      return json({ order:{orderNumber:data.order_number,status:data.status,totalIrr:String(data.total_irr)} });
    }
    return fail(404, "NOT_FOUND", "مسیر درخواست پیدا نشد.");
  } catch (e) {
    console.error("store-api error", e);
    return fail(500, "INTERNAL_ERROR", "خطای داخلی سرور رخ داد.");
  }
});
