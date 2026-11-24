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

    if (req.method === "GET" && path === "/api/marine-engines") {
      const { data, error } = await adminDb.from("cat_marine_engine_models")
        .select("model_key,model_name,application_group,application_type,source_url,source_name")
        .order("application_group", { ascending: true }).order("model_name", { ascending: true });
      if (error) {
        console.error("[store-api/marine-engines] listing failed", error.code, error.message);
        return fail(500, "MARINE_ENGINES_FAILED", "دریافت فهرست موتورهای دریایی ناموفق بود.");
      }
      return json({ items: (data ?? []).map(x => ({ modelKey:x.model_key, modelName:x.model_name, applicationGroup:x.application_group, applicationType:x.application_type, sourceUrl:x.source_url, sourceName:x.source_name })) });
    }

    if (req.method === "GET" && path === "/api/part-categories") {
      const { data, error } = await adminDb.from("cat_part_categories")
        .select("category_key,name,parent_key,source_url,source_count")
        .eq("is_active", true)
        .order("name", { ascending: true });
      if (error) {
        console.error("[store-api/part-categories] category listing failed", error.code, error.message);
        return fail(500, "PART_CATEGORIES_FAILED", "دریافت دسته‌بندی‌های کاتالوگ ناموفق بود.");
      }
      return json({ items: data ?? [] });
    }

    if (req.method === "GET" && path === "/api/products") {
      const u = new URL(req.url), includeImages = u.searchParams.get("includeImages") !== "false", q = clean(u.searchParams.get("q"), 100).replace(/[,%()_*\\\\]/g, " ").replace(/\\s+/g, " ").trim(), category = clean(u.searchParams.get("category"), 100), brand = clean(u.searchParams.get("brand"), 100), model = clean(u.searchParams.get("model"), 120);
      const baseProductQuery = () => {
        let productQuery = adminDb.from("products").select("*").eq("status", "ACTIVE").order("created_at", { ascending: false }).limit(100);
        if (category) productQuery = productQuery.eq("category", category);
        if (brand) productQuery = productQuery.eq("brand", brand);
        if (model) productQuery = productQuery.eq("machine_model", model);
        return productQuery;
      };
      let productData:any[] = [];
      if (q) {
        // Live catalog smoke tests run after this function deploys and report sanitized diagnostics.
        // Search product fields independently; a PostgREST OR expression must never
        // prevent the separate part-reference catalog search from running.
        const productResults = await Promise.all(["name","sku","brand","machine_model"].map(field => baseProductQuery().ilike(field, "%" + q + "%")));
        const productFailure = productResults.find(result => result.error);
        if (productFailure) { console.error("[store-api/products] product search failed", productFailure.error?.code, productFailure.error?.message); return fail(500, "PRODUCTS_FAILED", "دریافت محصولات ناموفق بود."); }
        const productMap = new Map<string,any>();
        for (const result of productResults) for (const product of result.data ?? []) productMap.set(String(product.id), product);
        productData = [...productMap.values()];
      } else {
        const result = await baseProductQuery();
        if (result.error) { console.error("[store-api/products] product listing failed", result.error.code, result.error.message); return fail(500, "PRODUCTS_FAILED", "دریافت محصولات ناموفق بود."); }
        productData = result.data ?? [];
      }
      const productItems = productData.map(p => ({ id:p.id, kind:"PRODUCT", sku:p.sku, name:p.name, brand:p.brand, category:p.category, machineModel:p.machine_model, description:p.description, imageUrl:p.image_url, priceIrr:p.price_irr == null ? null : String(p.price_irr), stock:p.stock, applicationType:p.application_type ?? "UNVERIFIED", applicationEvidence:p.application_evidence ?? null, applicationSourceUrl:p.application_source_url ?? null }));
      let partItems:any[] = [];
      if (q || model) {
        const fields = "id,part_number,part_number_normalized,name,description,engine_models,technical_group,source_name,source_url,source_note,verification_status,image_url,specifications,compatible_models,application_type,application_evidence,application_source_url";
        const basePartsQuery = () => adminDb.from("part_catalog").select(fields).eq("is_active",true).limit(100);
        const normalizeEngineFamily=(value:string)=>value.toUpperCase().replace(/\s+/g,"").replace(/CB$/,"");
        const familyModelCandidates=(value:string)=>value==="3512"?["3512","3512A","3512B","3512C","3512E","3512CB"]:value==="3516"?["3516","3516A","3516B","3516C","3516E","3516CB"]:[value];
        const requestedModel=normalizeEngineFamily(model);
        const searches:Promise<any>[] = [];
        if (q) {
          const normalized=q.toUpperCase().replace(/[^A-Z0-9]/g,"");
          // Keep part-number lookup independent from text/model filters. This avoids
          // PostgREST OR parsing edge cases for punctuation-heavy Cat part numbers.
          if (normalized) searches.push(basePartsQuery().ilike("part_number_normalized", "%" + normalized + "%"));
          searches.push(basePartsQuery().ilike("name", "%" + q + "%"));
          searches.push(basePartsQuery().ilike("description", "%" + q + "%"));
          const modelQuery=normalizeEngineFamily(normalized);
          if (/^[A-Z0-9]{2,20}$/i.test(modelQuery)) {
            const candidates=familyModelCandidates(modelQuery);
            searches.push(basePartsQuery().overlaps("engine_models",candidates));
          }
        }
        if (model) searches.push(basePartsQuery().overlaps("engine_models",familyModelCandidates(requestedModel)));
        const results=await Promise.all(searches);
        const failed=results.find(x=>x.error && x.error.code!=="42P01");
        if(failed)return fail(500,"PART_CATALOG_FAILED","جستجوی کاتالوگ پارت‌نامبر ناموفق بود.");
        const byId=new Map<string,any>();
        for(const result of results)for(const part of result.data??[])byId.set(String(part.id),part);
        const partRecords=[...byId.values()];
        // Resolve and cache the real OEM product image from the official Cat Parts Store.
        // Only a bounded number of missing images are fetched per request to protect latency.
        const imageResolved=includeImages ? await Promise.all(partRecords.slice(0,24).map(async (part:any)=>{
          let imageUrl=part.image_url??null;
          if(!imageUrl && /^https:\/\/parts\.cat\.com\//i.test(String(part.source_url??""))){
            try{
              const response=await fetch(String(part.source_url),{headers:{"user-agent":"Mozilla/5.0 AmootMachinePartsFinder/1.0","accept":"text/html"},signal:AbortSignal.timeout(5000)});
              if(response.ok){
                const html=await response.text();
                const match=html.match(/https?:\/\/caterpillar\.scene7\.com\/is\/image\/Caterpillar\/[^"'\\s<>]+/i);
                if(match?.[0]){
                  imageUrl=match[0].replace(/&amp;/g,"&");
                  await adminDb.from("part_catalog").update({image_url:imageUrl}).eq("id",part.id);
                }
              }
            }catch(_){}
          }
          return {...part,image_url:imageUrl};
        })) : partRecords;
        const imageById=new Map(imageResolved.map((part:any)=>[String(part.id),part]));
        partItems=partRecords.map((raw:any)=>{
          const p=imageById.get(String(raw.id))??raw;
          const models=[...new Set((p.engine_models??[]).map((m:string)=>String(m).toUpperCase()))];
          const compatibleModels=[...new Set((p.compatible_models?.length?p.compatible_models:p.engine_models??[]).map((m:string)=>String(m).toUpperCase()))];
          const supplierReference=String(p.source_name??"").toLowerCase().includes("hamkar");
          const partPageUrl=supplierReference?"https://htshco.ir/brands/caterpillar/parts/"+encodeURIComponent(p.part_number):p.source_url;
          const partImageUrl=p.image_url||(supplierReference?"https://htshco.ir/images/cat-parts/"+encodeURIComponent(p.part_number)+".webp":null);
          return {id:p.id,kind:"PART_REFERENCE",sku:p.part_number,name:p.name,brand:p.brand??"Caterpillar",category:p.technical_group??"قطعات موتور",machineModel:models.join(" / "),compatibleModels,technicalGroup:p.technical_group??null,applicationType:p.application_type??"UNVERIFIED",applicationEvidence:p.application_evidence??null,applicationSourceUrl:p.application_source_url??null,specifications:p.specifications??{},description:[p.description,"مدل‌های ثبت‌شده: "+(compatibleModels.join("، ")||"نیازمند بررسی"),p.source_note,"مرجع: "+p.source_name,"وضعیت مرجع: "+p.verification_status].filter(Boolean).join(" · "),imageUrl:partImageUrl,priceIrr:null,stock:0,sourceUrl:partPageUrl};
        });
      }
      const merged=[...productItems,...partItems].filter((item,index,all)=>all.findIndex(x=>String(x.sku).toUpperCase().replace(/[^A-Z0-9]/g,"")===String(item.sku).toUpperCase().replace(/[^A-Z0-9]/g,""))===index);
      return json({items:merged.slice(0,150),partReferenceCount:partItems.length});
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
      const { data, error } = await adminDb.from("quotes").insert({ quote_number: "AQ-" + crypto.randomUUID().replaceAll("-","").slice(0,10).toUpperCase(), user_id: quoteUserId, name, phone, message, product_sku: clean(body.productSku,80) || null, machine_model: clean(body.machineModel,120) || null }).select("quote_number,status,created_at").single();
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
      return json({ items: (data ?? []).map(o => ({ orderNumber: o.order_number, status: o.status, totalIrr: String(o.total_irr), createdAt: o.created_at, shippingCarrier:o.shipping_carrier, trackingNumber:o.tracking_number, shippedAt:o.shipped_at, items: o.order_items.map((i: any) => ({ nameSnapshot: i.name_snapshot, quantity: i.quantity, unitPriceIrr: String(i.unit_price_irr), lineTotalIrr: String(i.line_total_irr) })) })) });
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
      return json({ items: (data ?? []).map(o => ({ orderNumber:o.order_number, totalIrr:String(o.total_irr), status:o.status, createdAt:o.created_at, shippingCarrier:o.shipping_carrier, trackingNumber:o.tracking_number, shippedAt:o.shipped_at, user:{displayName:o.profiles?.display_name,identifier:o.profiles?.identifier}, items:o.order_items.map((i:any)=>({nameSnapshot:i.name_snapshot,quantity:i.quantity,unitPriceIrr:String(i.unit_price_irr),lineTotalIrr:String(i.line_total_irr)})) })) });
    }

    const shippingMatch = path.match(/^\/api\/admin\/orders\/([^/]+)\/shipping$/);
    if (req.method === "PATCH" && shippingMatch) {
      if (!canOperate) return fail(403,"FORBIDDEN","دسترسی مدیریت سفارش مجاز نیست.");
      const body = await req.json();
      const carrier = clean(body.carrier,100);
      const tracking = clean(body.trackingNumber,100);
      if ((carrier && carrier.length < 2) || (tracking && tracking.length < 3))
        return fail(400,"VALIDATION_ERROR","نام شرکت حمل یا شماره رهگیری معتبر نیست.");
      if (!!carrier !== !!tracking)
        return fail(400,"VALIDATION_ERROR","برای ثبت رهگیری، نام شرکت حمل و شماره رهگیری را هر دو وارد کنید.");
      const orderNumber = decodeURIComponent(shippingMatch[1]);
      const { data: current, error: readError } = await adminDb.from("orders")
        .select("id,status").eq("order_number",orderNumber).maybeSingle();
      if (readError) return fail(500,"SHIPPING_READ_FAILED","خواندن سفارش ناموفق بود.");
      if (!current) return fail(404,"NOT_FOUND","سفارش پیدا نشد.");
      if (!["PROCESSING","SHIPPED"].includes(current.status))
        return fail(409,"INVALID_ORDER_STATE","اطلاعات حمل فقط برای سفارش در حال پردازش یا ارسال‌شده قابل ثبت است.");
      const { data, error } = await adminDb.from("orders").update({
        shipping_carrier: carrier || null, tracking_number: tracking || null
      }).eq("id",current.id).select("order_number,shipping_carrier,tracking_number,shipped_at").single();
      if (error) return fail(500,"SHIPPING_UPDATE_FAILED","ذخیره اطلاعات حمل ناموفق بود.");
      return json({order:{orderNumber:data.order_number,shippingCarrier:data.shipping_carrier,trackingNumber:data.tracking_number,shippedAt:data.shipped_at}});
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

    if (path === "/api/admin/inventory/receipts" && req.method === "POST") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "ثبت رسید انبار فقط برای مدیر اصلی مجاز است.");
      const body = await req.json();
      if (!Array.isArray(body.items) || body.items.length < 1 || body.items.length > 100)
        return fail(400, "VALIDATION_ERROR", "رسید باید حداقل یک و حداکثر ۱۰۰ ردیف کالا داشته باشد.");
      const seen = new Set();
      const items = [];
      for (const raw of body.items) {
        const sku = clean(raw.sku, 80), quantity = Number(raw.quantity);
        if (!sku || seen.has(sku) || !Number.isInteger(quantity) || quantity < 1 || quantity > 1000000)
          return fail(400, "INVALID_RECEIPT_ITEMS", "کد کالا باید یکتا و تعداد هر ردیف عدد صحیح مثبت باشد.");
        seen.add(sku); items.push({ sku, quantity });
      }
      const receiptNumber = "WR-" + new Date().toISOString().replace(/[-:TZ.]/g, "").slice(0,14) + "-" + crypto.randomUUID().slice(0,6).toUpperCase();
      const { data, error } = await adminDb.rpc("amoot_receive_inventory", {
        p_receipt_number: receiptNumber, p_supplier: clean(body.supplier,160),
        p_document_number: clean(body.documentNumber,100), p_note: clean(body.note,1000),
        p_actor: profile.id, p_items: items
      });
      if (error) {
        const msg = error.message ?? "";
        if (msg.includes("PRODUCT_NOT_FOUND")) return fail(404,"PRODUCT_NOT_FOUND","یکی از کدهای کالا در انبار تعریف نشده است.");
        if (msg.includes("STOCK_LIMIT_EXCEEDED")) return fail(409,"STOCK_LIMIT_EXCEEDED","موجودی پس از ورود از سقف مجاز بیشتر می‌شود.");
        if (msg.includes("DUPLICATE_RECEIPT_SKU")) return fail(400,"INVALID_RECEIPT_ITEMS","کد کالای تکراری در رسید مجاز نیست.");
        return fail(400,"RECEIPT_FAILED","ثبت رسید انبار انجام نشد؛ اطلاعات رسید را بررسی کنید.");
      }
      return json({ receiptNumber, lineCount: items.length, success: true }, 201);
    }

    if (req.method === "GET" && path === "/api/admin/inventory/receipts") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "مشاهده رسیدهای انبار فقط برای مدیر اصلی مجاز است.");
      const { data, error } = await adminDb.from("inventory_receipts")
        .select("id,receipt_number,supplier,document_number,note,created_at,inventory_receipt_items(sku,product_name,quantity)")
        .order("created_at", { ascending: false }).limit(100);
      if (error) return fail(500,"RECEIPTS_FAILED","دریافت رسیدهای انبار ناموفق بود.");
      return json({ items:(data??[]).map(r=>({id:r.id,receiptNumber:r.receipt_number,supplier:r.supplier,documentNumber:r.document_number,note:r.note,createdAt:r.created_at,items:r.inventory_receipt_items??[]})) });
    }

    if (req.method === "GET" && path === "/api/admin/inventory/movements") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دفتر گردش انبار فقط برای مدیر اصلی مجاز است.");
      const params = new URL(req.url).searchParams;
      const sku = clean(params.get("sku"), 80);
      const type = clean(params.get("type"), 20).toUpperCase();
      if (type && !["IN","OUT","ADJUSTMENT","ORDER","CANCELLATION"].includes(type))
        return fail(400, "VALIDATION_ERROR", "نوع گردش موجودی معتبر نیست.");
      let query = adminDb.from("inventory_movements")
        .select("id,sku,product_name,movement_type,quantity_delta,stock_before,stock_after,reference,note,created_at")
        .order("created_at", { ascending: false }).limit(300);
      if (sku) query = query.eq("sku", sku);
      if (type) query = query.eq("movement_type", type);
      const { data, error } = await query;
      if (error) return fail(500, "INVENTORY_LEDGER_FAILED", "دریافت دفتر گردش موجودی ناموفق بود.");
      return json({ items: (data ?? []).map(m => ({
        id:m.id, sku:m.sku, productName:m.product_name, movementType:m.movement_type,
        quantityDelta:m.quantity_delta, stockBefore:m.stock_before, stockAfter:m.stock_after,
        reference:m.reference, note:m.note, createdAt:m.created_at
      })) });
    }

    if (req.method === "GET" && path === "/api/admin/inventory/low-stock") {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی گزارش انبار فقط برای مدیر اصلی مجاز است.");
      const requested = Number(new URL(req.url).searchParams.get("threshold") ?? 5);
      if (!Number.isInteger(requested) || requested < 0 || requested > 1000000)
        return fail(400, "VALIDATION_ERROR", "حد هشدار موجودی معتبر نیست.");
      const { data, error } = await adminDb.from("products")
        .select("sku,name,brand,category,stock,status")
        .eq("status", "ACTIVE").lte("stock", requested)
        .order("stock", { ascending: true }).order("name", { ascending: true }).limit(500);
      if (error) return fail(500, "LOW_STOCK_FAILED", "گزارش کمبود موجودی دریافت نشد.");
      return json({ threshold: requested, items: (data ?? []).map(p => ({
        sku:p.sku, name:p.name, brand:p.brand, category:p.category, stock:p.stock, status:p.status
      })) });
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

    if (req.method === "POST" && path === "/api/admin/kpart/import") {
      if (!isAdmin) return fail(403,"FORBIDDEN","دسترسی مدیریت مجاز نیست.");
      const body = await req.json();
      if (!Array.isArray(body.items) || body.items.length < 1 || body.items.length > 500)
        return fail(400,"VALIDATION_ERROR","فایل باید بین ۱ تا ۵۰۰ ردیف مرجع K-Part داشته باشد.");
      const rows:any[] = [], seen = new Set<string>();
      for (const raw of body.items) {
        const partNumber = clean(raw.partNumber ?? raw.part_number,80);
        const name = clean(raw.name,180);
        const modelName = clean(raw.modelName ?? raw.model_name,80).toUpperCase();
        const serialPrefix = clean(raw.serialPrefix ?? raw.serial_prefix,40).toUpperCase();
        const groupName = clean(raw.groupName ?? raw.group_name,180);
        const diagramRef = clean(raw.diagramRef ?? raw.diagram_ref,40);
        const quantityRaw = raw.quantity == null || raw.quantity === "" ? null : Number(raw.quantity);
        const sourceUrl = clean(raw.sourceUrl ?? raw.source_url,1000);
        const sourceNote = clean(raw.sourceNote ?? raw.source_note,500);
        const key = [partNumber,modelName,serialPrefix,groupName,diagramRef].map(x=>x.toUpperCase()).join("|");
        let parsed:URL|null = null;
        try { parsed = new URL(sourceUrl); } catch (_) {}
        if (!partNumber || !name || !modelName || !serialPrefix || !groupName ||
            !parsed || parsed.protocol !== "https:" || !/^(?:www\.)?k-part\.com$/i.test(parsed.hostname) ||
            (quantityRaw !== null && (!Number.isInteger(quantityRaw) || quantityRaw < 1 || quantityRaw > 100000)) ||
            seen.has(key))
          return fail(400,"INVALID_KPART_ROW","پارت‌نامبر، نام، مدل، پیشوند سریال، گروه، نشانی معتبر K-Part یا تعداد معتبر نیست.");
        seen.add(key);
        rows.push({
          part_number:partNumber, name, model_name:modelName, serial_prefix:serialPrefix,
          group_name:groupName, diagram_ref:diagramRef||null, quantity:quantityRaw,
          source_name:"K-Part (third-party)", source_url:sourceUrl, source_note:sourceNote||null,
          review_state:"CANDIDATE", source_accessed_at:new Date().toISOString()
        });
      }
      const {data,error} = await adminDb.from("kpart_catalog_evidence")
        .upsert(rows,{onConflict:"evidence_key"}).select("evidence_key");
      if(error) {
        console.error("[store-api/kpart/import] import failed",error.code,error.message);
        return fail(500,"KPART_IMPORT_FAILED","ثبت مراجع K-Part ناموفق بود؛ ابتدا migration مربوط را اجرا کنید.");
      }
      return json({imported:data?.length??rows.length,reviewState:"CANDIDATE",promotedToPartCatalog:false});
    }

    if (req.method === "POST" && path === "/api/admin/parts/import") {
      if (!isAdmin) return fail(403,"FORBIDDEN","دسترسی مدیریت مجاز نیست.");
      const body=await req.json();
      if(!Array.isArray(body.items)||body.items.length<1||body.items.length>500)return fail(400,"VALIDATION_ERROR","فایل باید بین ۱ تا ۵۰۰ ردیف پارت‌نامبر داشته باشد.");
      const rows:any[]=[],seen=new Set<string>();
      for(const raw of body.items){
        const partNumber=clean(raw.partNumber??raw.part_number??raw.sku,80),name=clean(raw.name,180);
        const engineModels=Array.isArray(raw.engineModels)?raw.engineModels.map((x:any)=>clean(x,40).toUpperCase()).filter(Boolean):clean(raw.engineModels??raw.engine_models,300).split(/[;,|]/).map(x=>clean(x,40).toUpperCase()).filter(Boolean);
        const sourceName=clean(raw.sourceName??raw.source_name,120),sourceUrl=clean(raw.sourceUrl??raw.source_url,1000);
        if(!partNumber||!name||!engineModels.length||!sourceName||!sourceUrl.startsWith("https://")||seen.has(partNumber.toUpperCase()))return fail(400,"INVALID_IMPORT_ROW","شماره قطعه، نام، مدل موتور و منبع معتبر برای هر ردیف الزامی است.");
        seen.add(partNumber.toUpperCase());
        const rawStatus=clean(raw.verificationStatus??raw.verification_status,40).toUpperCase();
        const status=["REFERENCE","OEM_VERIFIED","NEEDS_SERIAL_CHECK"].includes(rawStatus)?rawStatus:"REFERENCE";
        const sourceSerialNumber=clean(raw.sourceSerialNumber??raw.source_serial_number,80);
        const arrangementNumber=clean(raw.arrangementNumber??raw.arrangement_number,80);
        const sourceDocumentRef=clean(raw.sourceDocumentRef??raw.source_document_ref,160);
        if(status==="OEM_VERIFIED"&&(!/^cat\\s*(sis|sis2go)/i.test(sourceName)||sourceSerialNumber.length<3||arrangementNumber.length<2||sourceDocumentRef.length<3))return fail(400,"MISSING_CAT_SIS_EVIDENCE","تأیید OEM فقط با مرجع Cat SIS/SIS2GO، شماره سریال، Arrangement و شناسه سند قابل ثبت است.");
        rows.push({brand:"Caterpillar",part_number:partNumber,name,description:clean(raw.description,1000)||null,engine_models:[...new Set(engineModels)],technical_group:clean(raw.technicalGroup??raw.technical_group,100)||null,source_name:sourceName,source_url:sourceUrl,source_note:clean(raw.sourceNote??raw.source_note,500)||null,source_serial_number:sourceSerialNumber||null,arrangement_number:arrangementNumber||null,source_document_ref:sourceDocumentRef||null,source_accessed_at:status==="OEM_VERIFIED"?new Date().toISOString():null,verification_status:status});
      }
      const {data,error}=await adminDb.from("part_catalog").upsert(rows,{onConflict:"part_number"}).select("part_number");
      if(error)return fail(500,"PART_IMPORT_FAILED","ذخیره پارت‌نامبرها ناموفق بود؛ ابتدا migration کاتالوگ قطعات را اجرا کنید.");
      return json({imported:data?.length??rows.length});
    }

    const productMatch = path.match(/^\/api\/admin\/products\/([^/]+)$/);
    if (req.method === "PATCH" && productMatch) {
      if (!isAdmin) return fail(403, "FORBIDDEN", "دسترسی مدیریت مجاز نیست.");
      const body = await req.json();
      const name = clean(body.name,180), category = clean(body.category,100);
      const stock = Number(body.stock ?? 0);
      const price = body.priceIrr === "" || body.priceIrr == null ? null : Number(body.priceIrr);
      const imageUrl = clean(body.imageUrl,1000);
      if (name.length < 2 || !category || !Number.isInteger(stock) || stock < 0 || stock > 10000000 ||
          (price !== null && (!Number.isSafeInteger(price) || price < 0)) ||
          (imageUrl && !(/^(https:\/\/|http:\/\/|\.\.\/|\.\/|\/)/i.test(imageUrl)))) {
        return fail(400, "VALIDATION_ERROR", "نام، دسته‌بندی، قیمت، موجودی یا نشانی تصویر معتبر نیست.");
      }
      const { data, error } = await adminDb.from("products").update({
        name, brand:clean(body.brand,100)||null, category,
        machine_model:clean(body.machineModel,120)||null,
        description:clean(body.description,2000)||null,
        image_url:imageUrl||null, price_irr:price, stock
      }).eq("sku",decodeURIComponent(productMatch[1])).select("sku,name,stock,status").single();
      if (error || !data) return fail(404, "NOT_FOUND", "کالا پیدا نشد یا ذخیره آن ناموفق بود.");
      return json({ product:{sku:data.sku,name:data.name,stock:data.stock,status:data.status} });
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
