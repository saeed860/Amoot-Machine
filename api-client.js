/* Amoot Machine API bridge. Configure AMOOT_API_BASE_URL in api-config.js after deploying the API. */
(()=>{
 const base=String(window.AMOOT_API_BASE_URL||'').replace(/\/$/,'');
 const TOKEN_KEY='amoot_api_token_v1', USER_KEY='amoot_api_user_v1';
 const token=()=>localStorage.getItem(TOKEN_KEY)||'';
 async function api(path,{method='GET',body,auth=true,headers={}}={}){
  if(!base)throw new Error('API_NOT_CONFIGURED');
  const r=await fetch(base+path,{method,headers:{...(body?{'Content-Type':'application/json'}:{}),...(auth&&token()?{Authorization:'Bearer '+token()}:{}),...headers},body:body?JSON.stringify(body):undefined});
  const data=await r.json().catch(()=>({}));
  if(!r.ok)throw new Error(data.error?.message||'خطا در ارتباط با سرور');
  return data;
 }
 window.amootApi=api;
 window.amootApiConfigured=()=>Boolean(base);
 if(!base)return;
 const legacyOpenAuth=window.openAuth;
 window.openAuth=mode=>{
  if(mode==='forgot'){legacyOpenAuth(mode);return}
  window.showModal('<div class="auth-box"><h2>حساب کاربری آموت ماشین</h2><div class="notice">ورود و ثبت‌نام از طریق سرور انجام می‌شود.</div><div class="auth-tabs"><button type="button" id="apiLoginTab" class="active">ورود</button><button type="button" id="apiRegisterTab">ثبت‌نام</button></div><form id="apiAuthForm"><div class="field" id="apiNameField" hidden><label>نام و نام خانوادگی</label><input name="displayName" minlength="2" maxlength="100"></div><div class="field"><label>شماره موبایل یا ایمیل</label><input name="identifier" required minlength="5" autocomplete="username"></div><div class="field"><label>رمز عبور</label><input name="password" type="password" required minlength="10" maxlength="128" autocomplete="current-password"></div><button class="btn yellow auth-submit" id="apiAuthSubmit">ورود</button><p class="auth-foot" id="apiAuthMessage">رمز عبور باید حداقل ۱۰ کاراکتر باشد.</p></form></div>');
  let register=mode==='register';
  const form=document.querySelector('#apiAuthForm'),nameField=document.querySelector('#apiNameField'),submit=document.querySelector('#apiAuthSubmit'),message=document.querySelector('#apiAuthMessage');
  const setMode=v=>{register=v;nameField.hidden=!v;nameField.querySelector('input').required=v;submit.textContent=v?'ایجاد حساب':'ورود';document.querySelector('#apiLoginTab').classList.toggle('active',!v);document.querySelector('#apiRegisterTab').classList.toggle('active',v)};
  document.querySelector('#apiLoginTab').onclick=()=>setMode(false);document.querySelector('#apiRegisterTab').onclick=()=>setMode(true);setMode(register);
  form.onsubmit=async e=>{e.preventDefault();submit.disabled=true;message.textContent='در حال ارتباط با سرور...';const d=Object.fromEntries(new FormData(form));try{
   const result=await api(register?'/api/auth/register':'/api/auth/login',{method:'POST',auth:false,body:register?d:{identifier:d.identifier,password:d.password}});
   localStorage.setItem(TOKEN_KEY,result.token);localStorage.setItem(USER_KEY,JSON.stringify(result.user));
   const u={id:result.user.id,name:result.user.displayName,contact:result.user.identifier,profile:{phone:/^\+?[0-9۰-۹]{8,}$/.test(result.user.identifier)?result.user.identifier:''},addresses:[],favorites:[],orders:[]};
   if(typeof window.persistUser==='function')window.persistUser(u);
   window.closeModal();window.refreshAccountButton?.();window.toast(register?'حساب با موفقیت ساخته شد.':'با موفقیت وارد شدید.');window.accountDashboard?.();
  }catch(err){message.textContent=err.message==='API_NOT_CONFIGURED'?'نشانی API تنظیم نشده است.':err.message;submit.disabled=false}
  };
 };
 const oldLogout=window.logoutAccount;
 window.logoutAccount=()=>{localStorage.removeItem(TOKEN_KEY);localStorage.removeItem(USER_KEY);oldLogout?.()};
 const oldLoadProducts=window.loadProducts;
 window.loadProducts=async()=>{try{
  const params=new URLSearchParams(),q=document.querySelector('#search')?.value||'',category=document.querySelector('#quickCategory')?.value||'',brand=document.querySelector('#brandFilter')?.value||'',model=document.querySelector('#modelFilter')?.value||'';
  if(q)params.set('q',q);if(category)params.set('category',category);if(brand)params.set('brand',brand);if(model)params.set('model',model);
  const data=await api('/api/products?'+params.toString(),{auth:false});
  const mapped=data.items.map(p=>({id:p.id,sku:p.sku,name:p.name,brand:p.brand||'',category:p.category,machine_model:p.machineModel||'',description:p.description||'',price:p.priceIrr===null?0:Number(p.priceIrr),stock:p.stock,image:p.imageUrl||'./assets/product-pump.jpg'}));
  if(window.db&&Array.isArray(window.db.products)){window.db.products=mapped;window.products=mapped;window.renderProducts?.()}
  else oldLoadProducts?.();
 }catch(e){window.toast('دریافت محصولات از سرور ناموفق بود: '+e.message)}};
 window.customerOrders=async u=>{
  const el=document.querySelector('#customerContent');if(!el)return;el.innerHTML='<h3>سفارش‌های من</h3><div class="empty-state">در حال دریافت سفارش‌ها از سرور...</div>';
  try{const data=await api('/api/orders');el.innerHTML='<h3>سفارش‌های من ('+data.items.length+')</h3>'+(data.items.length?'<div class="customer-list">'+data.items.map(o=>'<article><b>'+o.orderNumber+' · '+Number(o.totalIrr).toLocaleString('fa-IR')+' ریال</b><small>'+new Date(o.createdAt).toLocaleString('fa-IR')+' · '+o.status+'</small><small>'+o.items.map(i=>i.nameSnapshot+' × '+i.quantity).join('، ')+'</small></article>').join('')+'</div>':'<div class="empty-state">هنوز سفارشی ثبت نکرده‌اید.</div>')}
  catch(e){el.innerHTML='<div class="empty-state">'+e.message+'</div>'}
 };
})();
