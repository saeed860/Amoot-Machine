import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const url = Deno.env.get("SUPABASE_URL")!;
const anonKey = Deno.env.get("SUPABASE_ANON_KEY")!;
const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;
const adminDb = createClient(url, serviceKey, { auth: { persistSession: false } });
const cors = {
  "Access-Control-Allow-Origin": "https://saeed860.github.io",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type, idempotency-key",
  "Access-Control-Allow-Methods": "GET, POST, PATCH, DELETE, OPTIONS",
  "Content-Type": "application/json; charset=utf-8",
  "Cache-Control": "no-store, max-age=0",
  "Pragma": "no-cache",
  "X-Content-Type-Options": "nosniff",
  "Referrer-Policy": "no-referrer",
};
const json = (data: unknown, status = 200) => new Response(JSON.stringify(data), { status, headers: cors });
const fail = (status: number, code: string, message: string) => json({ error: { code, message } }, status);
const clean = (v: unknown, max = 200) => String(v ?? "").trim().slice(0, max);
const userDto = (u: any) => ({ id: u.id, identifier: u.identifier, displayName: u.display_name, role: u.role, profile: { company: u.company ?? "", nationalId: u.national_id ?? "", phone: u.phone ?? "", birth: u.birth_date ?? "" } });

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
      const publicAuth = createClient(url, anonKey, { auth: { persistSession: false } });
      const { data, error } = await publicAuth.auth.signUp({ ...credentials, options: { data: { display_name: displayName, identifier } } });
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
      const publicAuth = createClient(url, anonKey, { auth: { persistSession: false } });
      const { data, error } = await publicAuth.auth.signInWithPassword(credentials);
      if (error || !data.user || !data.session) return fail(401, "INVALID_CREDENTIALS", "شماره/ایمیل یا رمز عبور صحیح نیست.");
      const { data: profile } = await adminDb.from("profiles").select("*").eq("id", data.user.id).single();
      if (!profile?.is_active) return fail(403, "ACCOUNT_DISABLED", "این حساب غیرفعال است.");
      return json({ token: data.session.access_token, user: userDto(profile) });
    }

    if (req.method === "GET" && path === "/api/products") {
      const u = new URL(req.url), q = clean(u.searchParams.get("q"), 100).replace(/[,%()_*\\]/g, " ").replace(/\s+/g, " ").trim(), category = clean(u.searchParams.get("category"), 100), brand = clean(u.searchParams.get("brand"), 100), model = clean(u.searchParams.get("model"), 120);
      let query = adminDb.from("products").select("*").eq("status", "ACTIVE").order("created_at", { ascending: false }).limit(100);
      if (category) query = query.eq("category", category);
      if (brand) query = query.eq("brand", brand);
      if (model) query = query.eq("machine_model", model);
      if (q) query = query.or(`name.ilike.%${q}%,sku.ilike.%${q}%,brand.ilike.%${q}%,machine_model.ilike.%${q}%`);
      const { data, error } = await query;
      if (error) return fail(500, "PRODUCTS_FAILED", "دریافت محصولات ناموفق بود.");
      return json({ items: (data ?? []).map(p => ({ id: p.id, sku: p.sku, name: p.name, brand: p.brand, category: p.category, machineModel: p.machine_model, description: p.description, imageUrl: p.image_url, priceIrr: p.price_irr == null ? null : String(p.price_irr), stock: p.stock })) });
    }

    if (req.method === "POST" && path === "/api/quotes") {
      const body = await req.json(), name = clean(body.name,100), phone = clean(body.phone,20), message = clean(body.message,2000);
      if (name.length < 2 || phone.length < 8 || message.length < 5) return fail(400, "VALIDATION_ERROR", "اطلاعات استعلام معتبر نیست.");
      const authHeader = req.headers.get("Authorization") ?? "";
      let quoteUserId = null;
      if (authHeader.startsWith("Bearer ")) {
        const userClient = createClient(url, anonKey, { global: { headers: { Authorization: authHeader } }, auth: { persistSession: false } });
        const { data } = await userClient.auth.getUser();
        quoteUserId = data.user?.id ?? null;
      }
      const { data, error } = await adminDb.from("quotes").insert({ quote_number: "AQ-" + crypto.randomUUID().replaceAll("-","").slice(0,10).toUpperCase(), user_id: quoteUserId, name, phone, message, product_sku: clean(body.productSku,80) || null }).select("quote_number,status,created_at").single();
      if (error) return fail(500, "QUOTE_FAILED", "ثبت استعلام ناموفق بود.");
      return json({ quote: { quoteNumber: data.quote_number, status: data.status, createdAt: data.created_at } }, 201);
    }

    const authHeader = req.headers.get("Authorization") ?? "";
    if (!authHeader.startsWith("Bearer ")) return fail(401, "UNAUTHORIZED", "ابتدا وارد حساب کاربری شوید.");
    const userClient = createClient(url, anonKey, { global: { headers: { Authorization: authHeader } }, auth: { persistSession: false } });
    const { data: authData, error: authError } = await userClient.auth.getUser();
    if (authError || !authData.user) return fail(401, "UNAUTHORIZED", "نشست معتبر نیست.");
    const { data: profile } = await adminDb.from("profiles").select("*").eq("id", authData.user.id).single();
    if (!profile?.is_active) return fail(403, "ACCOUNT_DISABLED", "این حساب غیرفعال است.");
    const isAdmin = profile.role === "ADMIN";
    const canOperate = ["ADMIN", "OPERATOR"].includes(profile.role);

    if (req.method === "GET" && path === "/api/me")
      return json(userDto(profile));

    if (req.method === "PATCH" && path === "/api/me") {
      const body = await req.json();
      const displayName = clean(body.displayName, 100), company = clean(body.company, 160);
      const nationalId = clean(body.nationalId, 20), phone = clean(body.phone, 20), birth = clean(body.birth, 20);
      if (displayName.length < 2 || (nationalId && !/^[0-9۰-۹]{8,12}$/.test(nationalId)) || (phone && phone.replace(/\D/g, "").length < 8))
        return fail(400, "VALIDATION_ERROR", "اطلاعات پروفایل معتبر نیست.");
      const { data, error } = await adminDb.from("profiles").update({
        display_name: displayName, company: company || null, national_id: nationalId || null,
        phone: phone || null, birth_date: birth || null
      }).eq("id", profile.id).select("*").single();
      if (error || !data) return fail(500, "PROFILE_UPDATE_FAILED", "ذخیره اطلاعات شخصی ناموفق بود.");
      return json(userDto(data));
    }

    if (req.method === "PATCH" && path === "/api/me/password") {
      const body = await req.json();
      const currentPassword = String(body.currentPassword ?? "");
      const newPassword = String(body.newPassword ?? "");
      if (currentPassword.length < 1 || newPassword.length < 10 || newPassword.length > 128 || currentPassword === newPassword)
        return fail(400, "VALIDATION_ERROR", "رمز جدید باید حداقل ۱۰ کاراکتر باشد و با رمز فعلی تفاوت داشته باشد.");
      const identifier = clean(profile.identifier, 190).toLowerCase();
      const credentials = identifier.includes("@") ? { email: identifier, password: currentPassword } : { phone: identifier, password: currentPassword };
      const reauth = createClient(url, anonKey, { auth: { persistSession: false } });
      const { error: reauthError } = await reauth.auth.signInWithPassword(credentials);
      if (reauthError) return fail(401, "CURRENT_PASSWORD_INVALID", "رمز عبور فعلی صحیح نیست.");
      const { error: updateError } = await adminDb.auth.admin.updateUserById(authData.user.id, { password: newPassword });
      if (updateError) return fail(400, "PASSWORD_UPDATE_FAILED", "تغییر رمز عبور انجام نشد.");
      return json({ success: true });
    }

    if (req.method === "GET" && path === "/api/addresses") {
      const { data, error } = await adminDb.from("addresses").select("id,title,recipient,phone,province,city,postal_code,address_line,is_default,created_at")
        .eq("user_id", profile.id).order("is_default", { ascending: false }).order("created_at", { ascending: false });
      if (error) return fail(500, "ADDRESSES_FAILED", "دریافت نشانی‌ها ناموفق بود.");
      return json({ items: (data ?? []).map(a => ({ id:a.id,title:a.title,recipient:a.recipient,phone:a.phone,province:a.province,city:a.city,postalCode:a.postal_code,addressLine:a.address_line,isDefault:a.is_default,createdAt:a.created_at })) });
    }

    if (req.method === "POST" && path === "/api/addresses") {
      const body = await req.json();
      const address = { user_id:profile.id, title:clean(body.title,80)||"نشانی", recipient:clean(body.recipient,100),
        phone:clean(body.phone,20), province:clean(body.province,80), city:clean(body.city,80),
        postal_code:clean(body.postalCode,20)||null, address_line:clean(body.addressLine,1000) };
      if (address.recipient.length < 2 || address.phone.replace(/\D/g,"").length < 8 || address.province.length < 2 || address.city.length < 2 || address.address_line.length < 8)
        return fail(400,"VALIDATION_ERROR","اطلاعات نشانی کامل یا معتبر نیست.");
      const { count, error: countError } = await adminDb.from("addresses").select("id",{count:"exact",head:true}).eq("user_id",profile.id);
      if (countError) return fail(500,"ADDRESSES_FAILED","ذخیره نشانی ناموفق بود.");
      const { data, error } = await adminDb.from("addresses").insert({...address,is_default:(count??0)===0})
        .select("id,title,recipient,phone,province,city,postal_code,address_line,is_default,created_at").single();
      if (error) return fail(500,"ADDRESS_CREATE_FAILED","ذخیره نشانی ناموفق بود.");
      return json({address:{id:data.id,title:data.title,recipient:data.recipient,phone:data.phone,province:data.province,city:data.city,postalCode:data.postal_code,addressLine:data.address_line,isDefault:data.is_default,createdAt:data.created_at}},201);
    }

    const addressDefaultMatch = path.match(/^\/api\/addresses\/([^/]+)\/default$/);
    if (req.method === "PATCH" && addressDefaultMatch) {
      const addressId=decodeURIComponent(addressDefaultMatch[1]);
      const {data:target,error:targetError}=await adminDb.from("addresses").select("id").eq("id",addressId).eq("user_id",profile.id).maybeSingle();
      if(targetError||!target)return fail(404,"ADDRESS_NOT_FOUND","نشانی پیدا نشد.");
      const {error:clearError}=await adminDb.from("addresses").update({is_default:false}).eq("user_id",profile.id);
      if(clearError)return fail(500,"ADDRESS_UPDATE_FAILED","تغییر نشانی پیش‌فرض ناموفق بود.");
      const {error}=await adminDb.from("addresses").update({is_default:true}).eq("id",addressId).eq("user_id",profile.id);
      if(error)return fail(500,"ADDRESS_UPDATE_FAILED","تغییر نشانی پیش‌فرض ناموفق بود.");
      return json({success:true});
    }

    const addressMatch=path.match(/^\/api\/addresses\/([^/]+)$/);
    if(req.method==="DELETE"&&addressMatch){
      const addressId=decodeURIComponent(addressMatch[1]);
      const {data:oldAddress,error:readError}=await adminDb.from("addresses").select("id,is_default").eq("id",addressId).eq("user_id",profile.id).maybeSingle();
      if(readError||!oldAddress)return fail(404,"ADDRESS_NOT_FOUND","نشانی پیدا نشد.");
      const {error}=await adminDb.from("addresses").delete().eq("id",addressId).eq("user_id",profile.id);
      if(error)return fail(500,"ADDRESS_DELETE_FAILED","حذف نشانی ناموفق بود.");
      if(oldAddress.is_default){
        const {data:next}=await adminDb.from("addresses").select("id").eq("user_id",profile.id).order("created_at",{ascending:false}).limit(1).maybeSingle();
        if(next)await adminDb.from("addresses").update({is_default:true}).eq("id",next.id).eq("user_id",profile.id);
      }
      return json({success:true});
    }

    if (req.method === "GET" && path === "/api/quotes") {
      const { data, error } = await adminDb.from("quotes").select("quote_number,name,phone,product_sku,machine_model,message,status,created_at")
        .eq("user_id", profile.id).order("created_at", { ascending:false }).limit(100);
      if (error) return fail(500,"QUOTES_FAILED","دریافت استعلام‌های شما ناموفق بود.");
      return json({ items:(data??[]).map(q=>({quoteNumber:q.quote_number,name:q.name,phone:q.phone,productSku:q.product_sku,machineModel:q.machine_model,message:q.message,status:q.status,createdAt:q.created_at})) });
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
      const createdOrder = Array.isArray(data) ? data[0] : data;
      return json({ order: { orderNumber: createdOrder.order_number, totalIrr: String(createdOrder.total_irr), status: createdOrder.status, createdAt: createdOrder.created_at } }, 201);
    }

    if (req.method === "GET" && path === "/api/admin/orders") {
      if (!canOperate) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const { data, error } = await adminDb.from("orders").select("*, profiles(display_name,identifier), order_items(*)").order("created_at", { ascending: false }).limit(200);
      if (error) return fail(500, "ADMIN_ORDERS_FAILED", "دریافت سفارش‌ها ناموفق بود.");
      return json({ items: (data ?? []).map(o => ({ orderNumber:o.order_number, totalIrr:String(o.total_irr), status:o.status, createdAt:o.created_at, user:{displayName:o.profiles?.display_name,identifier:o.profiles?.identifier}, items:o.order_items.map((i:any)=>({nameSnapshot:i.name_snapshot,quantity:i.quantity,unitPriceIrr:String(i.unit_price_irr),lineTotalIrr:String(i.line_total_irr)})) })) });
    }

    const statusMatch = path.match(/^\/api\/admin\/orders\/([^/]+)\/status$/);
    if (req.method === "PATCH" && statusMatch) {
      if (!canOperate) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const status = clean((await req.json()).status,30);
      if (!["PENDING","CONFIRMED","PROCESSING","SHIPPED","DELIVERED","CANCELLED"].includes(status)) return fail(400,"VALIDATION_ERROR","وضعیت سفارش معتبر نیست.");
      const { data, error } = await adminDb.rpc("amoot_update_order_status", {
        p_order_number: decodeURIComponent(statusMatch[1]), p_status: status
      });
      if (error) {
        const msg = error.message ?? "";
        if (msg.includes("ORDER_NOT_FOUND")) return fail(404,"NOT_FOUND","سفارش پیدا نشد.");
        if (msg.includes("INVALID_ORDER_TRANSITION")) return fail(409,"INVALID_ORDER_TRANSITION","این تغییر وضعیت سفارش مجاز نیست.");
        return fail(500,"ORDER_STATUS_FAILED","به‌روزرسانی وضعیت سفارش ناموفق بود.");
      }
      const updated = Array.isArray(data) ? data[0] : data;
      return json({ order:{orderNumber:updated.order_number,status:updated.status,totalIrr:String(updated.total_irr)} });
    }

    if (req.method === "GET" && path === "/api/admin/products") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const { data, error } = await adminDb.from("products").select("*").order("updated_at", { ascending: false }).limit(500);
      if (error) return fail(500, "ADMIN_PRODUCTS_FAILED", "دریافت فهرست کالاها ناموفق بود.");
      return json({ items: (data ?? []).map(p => ({ sku:p.sku, name:p.name, brand:p.brand, category:p.category, machineModel:p.machine_model, description:p.description, imageUrl:p.image_url, priceIrr:p.price_irr == null ? "" : String(p.price_irr), stock:p.stock, status:p.status })) });
    }

    if (req.method === "POST" && path === "/api/admin/products/import") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const body = await req.json();
      if (!Array.isArray(body.items) || body.items.length < 1 || body.items.length > 500)
        return fail(400, "VALIDATION_ERROR", "فایل باید بین ۱ تا ۵۰۰ ردیف کالا داشته باشد.");
      const rows = [];
      const seen = new Set();
      for (const raw of body.items) {
        const sku = clean(raw.sku,80), name = clean(raw.name,180), category = clean(raw.category,100);
        const stock = Number(raw.stock ?? 0), price = raw.priceIrr === "" || raw.priceIrr == null ? null : Number(raw.priceIrr);
        if (!sku || !name || !category || seen.has(sku) || !Number.isInteger(stock) || stock < 0 || stock > 10000000 || (price !== null && (!Number.isSafeInteger(price) || price < 0)))
          return fail(400, "INVALID_IMPORT_ROW", "کد کالا، نام، دسته‌بندی، قیمت یا موجودی در فایل معتبر نیست.");
        seen.add(sku);
        const status = ["ACTIVE","INACTIVE","ARCHIVED"].includes(clean(raw.status,20).toUpperCase()) ? clean(raw.status,20).toUpperCase() : "ACTIVE";
        rows.push({ sku, name, brand:clean(raw.brand,100)||null, category, machine_model:clean(raw.machineModel,120)||null, description:clean(raw.description,2000)||null, image_url:clean(raw.imageUrl,1000)||null, price_irr:price, stock, status });
      }
      const { data, error } = await adminDb.from("products").upsert(rows, { onConflict:"sku" }).select("sku");
      if (error) return fail(500, "IMPORT_FAILED", "ذخیره گروهی کالاها ناموفق بود.");
      return json({ imported: data?.length ?? rows.length });
    }

    const productStatusMatch = path.match(/^\/api\/admin\/products\/([^/]+)\/status$/);
    if (req.method === "PATCH" && productStatusMatch) {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const status = clean((await req.json()).status,20).toUpperCase();
      if (!["ACTIVE","INACTIVE","ARCHIVED"].includes(status)) return fail(400,"VALIDATION_ERROR","وضعیت کالا معتبر نیست.");
      const { data, error } = await adminDb.from("products").update({status}).eq("sku",decodeURIComponent(productStatusMatch[1])).select("sku,status").single();
      if (error || !data) return fail(404,"NOT_FOUND","کالا پیدا نشد.");
      return json({ product:data });
    }


    if (req.method === "GET" && path === "/api/admin/customers") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const { data, error } = await adminDb.from("profiles").select("id,identifier,display_name,role,is_active,created_at").eq("role","CUSTOMER").order("created_at",{ascending:false}).limit(500);
      if (error) return fail(500,"CUSTOMERS_FAILED","دریافت کاربران ناموفق بود.");
      return json({items:(data??[]).map(u=>({id:u.id,identifier:u.identifier,displayName:u.display_name,role:u.role,isActive:u.is_active,createdAt:u.created_at}))});
    }

    const customerMatch = path.match(/^\/api\/admin\/customers\/([^/]+)\/active$/);
    if (req.method === "PATCH" && customerMatch) {
      if (!isAdmin) return fail(403,"FORBIDDEN","دسترسی مدیریت مجاز نیست.");
      const active=(await req.json()).isActive;
      if (typeof active !== "boolean") return fail(400,"VALIDATION_ERROR","وضعیت حساب معتبر نیست.");
      const {data,error}=await adminDb.from("profiles").update({is_active:active}).eq("id",decodeURIComponent(customerMatch[1])).eq("role","CUSTOMER").select("id,is_active").single();
      if(error||!data) return fail(404,"NOT_FOUND","کاربر پیدا نشد.");
      return json({customer:{id:data.id,isActive:data.is_active}});
    }

    if (req.method === "GET" && path === "/api/admin/quotes") {
      if (!canOperate) return fail(403,"FORBIDDEN","دسترسی مدیریت مجاز نیست.");
      const {data,error}=await adminDb.from("quotes").select("quote_number,name,phone,product_sku,machine_model,message,status,created_at").order("created_at",{ascending:false}).limit(300);
      if(error) return fail(500,"QUOTES_FAILED","دریافت استعلام‌ها ناموفق بود.");
      return json({items:(data??[]).map(q=>({quoteNumber:q.quote_number,name:q.name,phone:q.phone,productSku:q.product_sku,machineModel:q.machine_model,message:q.message,status:q.status,createdAt:q.created_at}))});
    }

    const quoteMatch = path.match(/^\/api\/admin\/quotes\/([^/]+)\/status$/);
    if (req.method === "PATCH" && quoteMatch) {
      if (!canOperate) return fail(403,"FORBIDDEN","دسترسی مدیریت مجاز نیست.");
      const status=clean((await req.json()).status,20).toUpperCase();
      if(!["NEW","CONTACTED","CLOSED"].includes(status)) return fail(400,"VALIDATION_ERROR","وضعیت استعلام معتبر نیست.");
      const {data,error}=await adminDb.from("quotes").update({status}).eq("quote_number",decodeURIComponent(quoteMatch[1])).select("quote_number,status").single();
      if(error||!data) return fail(404,"NOT_FOUND","استعلام پیدا نشد.");
      return json({quote:{quoteNumber:data.quote_number,status:data.status}});
    }

    return fail(404, "NOT_FOUND", "مسیر درخواست پیدا نشد.");
  } catch (e) {
    console.error("store-api error", e);
    return fail(500, "INTERNAL_ERROR", "خطای داخلی سرور رخ داد.");
  }
});
