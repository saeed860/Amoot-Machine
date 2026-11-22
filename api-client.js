/* Amoot Machine API bridge. Configure AMOOT_API_BASE_URL in api-config.js after deploying the API. */
(()=>{
 const base=String(window.AMOOT_API_BASE_URL||'').replace(/\/$/,'');
 const TOKEN_KEY='amoot_api_token_v1', USER_KEY='amoot_api_user_v1';
 const publicKey=String(window.AMOOT_SUPABASE_ANON_KEY||'');
 const escHtml=v=>String(v??'').replace(/[&<>"']/g,ch=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[ch]));
 const token=()=>localStorage.getItem(TOKEN_KEY)||'';
 async function api(path,{method='GET',body,auth=true,headers={}}={}){
  if(!base)throw new Error('API_NOT_CONFIGURED');
  const r=await fetch(base+path,{method,headers:{...(body?{'Content-Type':'application/json'}:{}),...(publicKey?{apikey:publicKey}:{}),...(auth&&token()?{Authorization:'Bearer '+token()}:{}),...headers},body:body?JSON.stringify(body):undefined});
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

 const legacyOpenQuote=window.openQuote;
 window.openQuote=(name='')=>{legacyOpenQuote(name);const form=document.querySelector('#quoteForm');if(!form)return;form.onsubmit=async e=>{e.preventDefault();const d=Object.fromEntries(new FormData(form));const button=form.querySelector('button[type=submit],button:not([type])');if(button)button.disabled=true;try{const result=await api('/api/quotes',{method:'POST',auth:false,body:{name:d.name,phone:d.phone,message:d.details,productSku:(d.details.match(/کد کالا:\s*([^|]+)/)||[])[1]?.trim()}});window.closeModal();window.toast('درخواست استعلام با شماره '+result.quote.quoteNumber+' در سرور ثبت شد.')}catch(err){window.toast(err.message);if(button)button.disabled=false}}};


 window.openAdmin=()=>{
  window.showModal('<div class="auth-box"><h2>ورود مدیریت سروری</h2><div class="notice">دسترسی مدیریت با حساب ADMIN یا OPERATOR کنترل می‌شود.</div><form id="apiAdminLogin"><div class="field"><label>ایمیل یا شناسه مدیر</label><input name="identifier" required></div><div class="field"><label>رمز عبور</label><input name="password" type="password" required></div><button class="btn yellow">ورود امن</button></form></div>');
  document.querySelector('#apiAdminLogin').onsubmit=async e=>{e.preventDefault();const f=e.target,b=f.querySelector('button'),d=Object.fromEntries(new FormData(f));b.disabled=true;try{const result=await api('/api/auth/login',{method:'POST',auth:false,body:d});if(!['ADMIN','OPERATOR'].includes(result.user.role))throw new Error('این حساب دسترسی مدیریت ندارد.');localStorage.setItem(TOKEN_KEY,result.token);localStorage.setItem(USER_KEY,JSON.stringify(result.user));await renderAdminOrders()}catch(err){window.toast(err.message);b.disabled=false}};
 };
 async function renderAdminOrders(){try{const data=await api('/api/admin/orders');window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · SECURE ADMIN</div><h3>مدیریت سفارش‌ها ('+data.items.length+')</h3></div><button class="mini red" onclick="logoutAccount()">خروج</button></div><div class="table-wrap"><table><thead><tr><th>شماره سفارش</th><th>مشتری</th><th>مبلغ (ریال)</th><th>وضعیت</th><th>عملیات</th></tr></thead><tbody>'+data.items.map(o=>'<tr><td dir="ltr">'+escHtml(o.orderNumber)+'</td><td>'+escHtml(o.user.displayName||'')+'<br>'+escHtml(o.user.identifier||'')+'</td><td>'+Number(o.totalIrr).toLocaleString('fa-IR')+'</td><td>'+escHtml(o.status)+'</td><td><select data-status="'+escHtml(o.orderNumber)+'"><option>PENDING</option><option>CONFIRMED</option><option>PROCESSING</option><option>SHIPPED</option><option>DELIVERED</option><option>CANCELLED</option></select><button class="mini" data-save-status="'+o.orderNumber+'">ثبت</button></td></tr>').join('')+'</tbody></table></div>');document.querySelectorAll('[data-status]').forEach(x=>x.value=data.items.find(o=>o.orderNumber===x.dataset.status)?.status||'PENDING');document.querySelectorAll('[data-save-status]').forEach(b=>b.onclick=async()=>{try{const id=b.dataset.saveStatus,status=document.querySelector('[data-status="'+id+'"]').value;await api('/api/admin/orders/'+encodeURIComponent(id)+'/status',{method:'PATCH',body:{status}});window.toast('وضعیت سفارش به‌روزرسانی شد.')}catch(e){window.toast(e.message)}})}catch(e){window.toast(e.message)}}

 const oldLogout=window.logoutAccount;
 window.logoutAccount=()=>{localStorage.removeItem(TOKEN_KEY);localStorage.removeItem(USER_KEY);oldLogout?.()};
 const oldLoadProducts=window.loadProducts;
 window.loadProducts=async()=>{try{
  const params=new URLSearchParams(),q=document.querySelector('#search')?.value||'',category=document.querySelector('#quickCategory')?.value||'',brand=document.querySelector('#brandFilter')?.value||'',model=document.querySelector('#modelFilter')?.value||'';
  if(q)params.set('q',q);if(category)params.set('category',category);if(brand)params.set('brand',brand);if(model)params.set('model',model);
  const data=await api('/api/products?'+params.toString(),{auth:false});
  const mapped=data.items.map(p=>({id:(()=>{let h=2166136261;for(const ch of String(p.sku)){h=Math.imul(h^ch.charCodeAt(0),16777619)}return h>>>0})(),serverId:p.id,sku:p.sku,name:p.name,brand:p.brand||'',category:p.category,machine_model:p.machineModel||'',description:p.description||'',price:p.priceIrr===null?0:Number(p.priceIrr)/10,stock:p.stock,image:p.imageUrl?(p.imageUrl.startsWith('/')?'.'+p.imageUrl:p.imageUrl):'./assets/product-pump.jpg'}));
  if(typeof window.setApiProducts==='function')window.setApiProducts(mapped);else oldLoadProducts?.();
 }catch(e){window.toast('دریافت محصولات از سرور ناموفق بود: '+e.message)}};
 if(base)window.loadProducts?.();
 window.customerOrders=async u=>{
  const el=document.querySelector('#customerContent');if(!el)return;el.innerHTML='<h3>سفارش‌های من</h3><div class="empty-state">در حال دریافت سفارش‌ها از سرور...</div>';
  try{const data=await api('/api/orders');el.innerHTML='<h3>سفارش‌های من ('+data.items.length+')</h3>'+(data.items.length?'<div class="customer-list">'+data.items.map(o=>'<article><b>'+escHtml(o.orderNumber)+' · '+Number(o.totalIrr).toLocaleString('fa-IR')+' ریال</b><small>'+new Date(o.createdAt).toLocaleString('fa-IR')+' · '+escHtml(o.status)+'</small><small>'+o.items.map(i=>escHtml(i.nameSnapshot)+' × '+Number(i.quantity)).join('، ')+'</small></article>').join('')+'</div>':'<div class="empty-state">هنوز سفارشی ثبت نکرده‌اید.</div>')}
  catch(e){el.innerHTML='<div class="empty-state">'+e.message+'</div>'}
 };
})();
