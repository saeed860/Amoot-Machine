/* Amoot Machine API bridge. Configure AMOOT_API_BASE_URL in api-config.js after deploying the API. */
(()=>{
 const base=String(window.AMOOT_API_BASE_URL||'').replace(/\/$/,'');
 const TOKEN_KEY='amoot_api_token_v1', USER_KEY='amoot_api_user_v1';
 const publicKey=String(window.AMOOT_SUPABASE_ANON_KEY||'');
 const escHtml=v=>String(v??'').replace(/[&<>"']/g,ch=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[ch]));
 const token=()=>localStorage.getItem(TOKEN_KEY)||'';
 async function api(path,{method='GET',body,auth=true,headers={}}={}){
  if(!base)throw new Error('API_NOT_CONFIGURED');
  const controller=new AbortController();const timeout=setTimeout(()=>controller.abort(),9000);
  let r;try{r=await fetch(base+path,{method,headers:{...(body?{'Content-Type':'application/json'}:{}),...(publicKey?{apikey:publicKey}:{}),...(auth&&token()?{Authorization:'Bearer '+token()}:{}),...headers},body:body?JSON.stringify(body):undefined,signal:controller.signal})}finally{clearTimeout(timeout)}
  const data=await r.json().catch(()=>({}));
  if(!r.ok)throw new Error(data.error?.message||'خطا در ارتباط با سرور');
  return data;
 }
 window.amootApi=api;
 window.amootApiConfigured=()=>Boolean(base);
 if(!base)return;
 const legacyAccountDashboard=window.accountDashboard;
 window.accountDashboard=(tab='overview')=>{
  legacyAccountDashboard?.(tab);
  if(!base||!token()||!['overview','profile','addresses','quotes','security'].includes(tab))return;
  const host=document.querySelector('#customerContent');if(!host)return;
  if(tab==='overview')renderServerOverview(host);
  if(tab==='profile')renderServerProfile(host);
  if(tab==='addresses')renderServerAddresses(host);
  if(tab==='quotes')renderServerQuotes(host);
  if(tab==='security')renderServerSecurity(host);
 };
 async function renderServerProfile(host){
  host.innerHTML='<h3>اطلاعات شخصی</h3><div class="empty-state">در حال دریافت اطلاعات...</div>';
  try{
   const u=await api('/api/me'),p=u.profile||{};
   host.innerHTML='<h3>اطلاعات شخصی</h3><form id="serverProfileForm"><div class="form-grid">'+
    '<div class="field"><label>نام و نام خانوادگی</label><input name="displayName" value="'+escHtml(u.displayName)+'" required maxlength="100"></div>'+
    '<div class="field"><label>شناسه ورود</label><input value="'+escHtml(u.identifier)+'" disabled></div>'+
    '<div class="field"><label>نام شرکت</label><input name="company" value="'+escHtml(p.company)+'" maxlength="160"></div>'+
    '<div class="field"><label>کد ملی / شناسه ملی</label><input name="nationalId" value="'+escHtml(p.nationalId)+'" maxlength="20"></div>'+
    '<div class="field"><label>تلفن تماس</label><input name="phone" value="'+escHtml(p.phone)+'" maxlength="20"></div>'+
    '<div class="field"><label>تاریخ تولد</label><input name="birth" value="'+escHtml(p.birth)+'" placeholder="مثلاً ۱۳۷۰/۰۱/۰۱" maxlength="20"></div>'+
    '</div><button class="btn yellow" type="submit">ذخیره اطلاعات</button><p class="auth-foot" id="serverProfileMessage"></p></form>';
   host.querySelector('#serverProfileForm').onsubmit=async ev=>{ev.preventDefault();const b=ev.target.querySelector('button'),m=host.querySelector('#serverProfileMessage'),d=Object.fromEntries(new FormData(ev.target));b.disabled=true;m.textContent='در حال ذخیره...';try{const saved=await api('/api/me',{method:'PATCH',body:d});const local=window.currentUser?.();if(local){local.name=saved.displayName;local.profile=saved.profile;window.persistUser?.(local)}const apiUser=JSON.parse(localStorage.getItem(USER_KEY)||'{}');apiUser.displayName=saved.displayName;apiUser.profile=saved.profile;localStorage.setItem(USER_KEY,JSON.stringify(apiUser));m.textContent='اطلاعات با موفقیت در حساب شما ذخیره شد.';window.toast('پروفایل به‌روزرسانی شد.')}catch(err){m.textContent=err.message}finally{b.disabled=false}};
  }catch(err){host.innerHTML='<h3>اطلاعات شخصی</h3><div class="notice">'+escHtml(err.message)+'</div>'}
 }
 async function renderServerOverview(host){
  host.innerHTML='<h3>نمای کلی حساب</h3><div class="empty-state">در حال دریافت اطلاعات حساب...</div>';
  try{
   const [orders,quotes,addresses]=await Promise.all([api('/api/orders'),api('/api/quotes'),api('/api/addresses')]);
   const orderRows=orders.items||[],quoteRows=quotes.items||[],addressRows=addresses.items||[];
   host.innerHTML='<h3>نمای کلی حساب</h3><div class="customer-stats"><div><b>'+orderRows.length+'</b><small>سفارش ثبت‌شده</small></div><div><b>'+quoteRows.length+'</b><small>درخواست استعلام</small></div><div><b>'+addressRows.length+'</b><small>نشانی ذخیره‌شده</small></div></div><h4>دسترسی سریع</h4><div class="quick-links"><button onclick="accountDashboard(\'orders\')">پیگیری سفارش‌ها ←</button><button onclick="accountDashboard(\'quotes\')">پیگیری استعلام‌ها ←</button><button onclick="accountDashboard(\'profile\')">ویرایش اطلاعات شخصی ←</button><button onclick="accountDashboard(\'addresses\')">مدیریت نشانی‌ها ←</button><button onclick="accountDashboard(\'security\')">امنیت و تغییر رمز ←</button></div>';
  }catch(err){host.innerHTML='<h3>نمای کلی حساب</h3><div class="notice">'+escHtml(err.message)+'</div>'}
 }
 async function renderServerSecurity(host){
  host.innerHTML='<h3>امنیت حساب</h3><div class="notice">برای تغییر رمز، رمز فعلی دوباره بررسی می‌شود و رمز جدید در حساب سروری شما ثبت خواهد شد.</div><form id="serverPasswordForm"><div class="field"><label>رمز عبور فعلی</label><input name="currentPassword" type="password" autocomplete="current-password" required></div><div class="field"><label>رمز عبور جدید</label><input name="newPassword" type="password" minlength="10" maxlength="128" autocomplete="new-password" required></div><div class="field"><label>تکرار رمز جدید</label><input name="confirmPassword" type="password" minlength="10" maxlength="128" autocomplete="new-password" required></div><button class="btn yellow" type="submit">تغییر رمز عبور</button><p class="auth-foot" id="serverPasswordMessage"></p></form>';
  host.querySelector('#serverPasswordForm').onsubmit=async ev=>{
   ev.preventDefault();const form=ev.target,d=Object.fromEntries(new FormData(form)),button=form.querySelector('button'),message=host.querySelector('#serverPasswordMessage');
   if(d.newPassword!==d.confirmPassword){message.textContent='تکرار رمز جدید مطابقت ندارد.';return}
   button.disabled=true;message.textContent='در حال بررسی و تغییر رمز...';
   try{await api('/api/me/password',{method:'PATCH',body:{currentPassword:d.currentPassword,newPassword:d.newPassword}});form.reset();message.textContent='رمز عبور حساب شما با موفقیت تغییر کرد.';window.toast('رمز عبور تغییر کرد.')}
   catch(err){message.textContent=err.message}
   finally{button.disabled=false}
  };
 }
 async function renderServerQuotes(host){
  host.innerHTML='<h3>استعلام‌های من</h3><div class="empty-state">در حال دریافت درخواست‌ها...</div>';
  try{
   const data=await api('/api/quotes'),rows=data.items||[];
   host.innerHTML='<h3>استعلام‌های من ('+rows.length+')</h3>'+(rows.length?'<div class="customer-list">'+rows.map(q=>'<article><b>'+escHtml(q.quoteNumber)+' · '+escHtml(q.status)+'</b><small>'+new Date(q.createdAt).toLocaleString('fa-IR')+' · '+escHtml(q.phone)+'</small><small>'+escHtml(q.productSku||'بدون کد کالا')+' · '+escHtml(q.message)+'</small></article>').join('')+'</div>':'<div class="empty-state">هنوز درخواست استعلامی ثبت نکرده‌اید.</div>');
  }catch(err){host.innerHTML='<h3>استعلام‌های من</h3><div class="notice">'+escHtml(err.message)+'</div>'}
 }
 async function renderServerAddresses(host){
  host.innerHTML='<h3>نشانی‌های من</h3><div class="empty-state">در حال دریافت نشانی‌ها...</div>';
  try{
   const data=await api('/api/addresses'),rows=data.items||[];
   host.innerHTML='<h3>نشانی‌های من ('+rows.length+')</h3><form id="serverAddressForm"><div class="field"><label>عنوان نشانی</label><input name="title" placeholder="مثلاً دفتر مرکزی" required maxlength="80"></div>'+
    '<div class="form-grid"><div class="field"><label>نام تحویل‌گیرنده</label><input name="recipient" required maxlength="100"></div><div class="field"><label>شماره تماس</label><input name="phone" required maxlength="20"></div>'+
    '<div class="field"><label>استان</label><input name="province" required maxlength="80"></div><div class="field"><label>شهر</label><input name="city" required maxlength="80"></div><div class="field"><label>کد پستی</label><input name="postalCode" maxlength="20"></div></div>'+
    '<div class="field"><label>نشانی کامل</label><textarea name="addressLine" required maxlength="1000"></textarea></div><button class="btn yellow" type="submit">افزودن نشانی</button><p class="auth-foot" id="serverAddressMessage"></p></form>'+
    '<div class="customer-list">'+rows.map(a=>'<article><b>'+escHtml(a.title)+(a.isDefault?' · پیش‌فرض':'')+'</b><small>'+escHtml(a.province)+'، '+escHtml(a.city)+'، '+escHtml(a.addressLine)+'</small><small>'+escHtml(a.recipient)+' · '+escHtml(a.phone)+' · '+escHtml(a.postalCode||'')+'</small><button class="mini red" data-address-delete="'+escHtml(a.id)+'">حذف نشانی</button> '+(a.isDefault?'':'<button class="mini" data-address-default="'+escHtml(a.id)+'">انتخاب پیش‌فرض</button>')+'</article>').join('')+'</div>';
   host.querySelector('#serverAddressForm').onsubmit=async ev=>{ev.preventDefault();const b=ev.target.querySelector('button'),m=host.querySelector('#serverAddressMessage'),d=Object.fromEntries(new FormData(ev.target));b.disabled=true;m.textContent='در حال ذخیره...';try{await api('/api/addresses',{method:'POST',body:d});window.toast('نشانی در حساب شما ذخیره شد.');await renderServerAddresses(host)}catch(err){m.textContent=err.message;b.disabled=false}};
   host.querySelectorAll('[data-address-delete]').forEach(b=>b.onclick=async()=>{if(!confirm('این نشانی حذف شود؟'))return;b.disabled=true;try{await api('/api/addresses/'+encodeURIComponent(b.dataset.addressDelete),{method:'DELETE'});await renderServerAddresses(host)}catch(err){window.toast(err.message);b.disabled=false}});
   host.querySelectorAll('[data-address-default]').forEach(b=>b.onclick=async()=>{b.disabled=true;try{await api('/api/addresses/'+encodeURIComponent(b.dataset.addressDefault)+'/default',{method:'PATCH',body:{}});await renderServerAddresses(host)}catch(err){window.toast(err.message);b.disabled=false}});
  }catch(err){host.innerHTML='<h3>نشانی‌های من</h3><div class="notice">'+escHtml(err.message)+'</div>'}
 }
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
   const u={id:result.user.id,name:result.user.displayName,contact:result.user.identifier,profile:result.user.profile||{phone:/^\+?[0-9۰-۹]{8,}$/.test(result.user.identifier)?result.user.identifier:''},addresses:[],favorites:[],orders:[]};
   if(typeof window.persistUser==='function')window.persistUser(u);
   window.closeModal();window.refreshAccountButton?.();window.toast(register?'حساب با موفقیت ساخته شد.':'با موفقیت وارد شدید.');window.accountDashboard?.();
  }catch(err){message.textContent=err.message==='API_NOT_CONFIGURED'?'نشانی API تنظیم نشده است.':err.message;submit.disabled=false}
  };
 };

 const legacyOpenQuote=window.openQuote;
 window.openQuote=(name='')=>{legacyOpenQuote(name);const form=document.querySelector('#quoteForm');if(!form)return;form.onsubmit=async e=>{e.preventDefault();const d=Object.fromEntries(new FormData(form));const button=form.querySelector('button[type=submit],button:not([type])');if(button)button.disabled=true;try{const result=await api('/api/quotes',{method:'POST',body:{name:d.name,phone:d.phone,message:d.details,productSku:(d.details.match(/کد کالا:\s*([^|]+)/)||[])[1]?.trim()}});window.closeModal();window.toast('درخواست استعلام با شماره '+result.quote.quoteNumber+' در سرور ثبت شد.')}catch(err){window.toast(err.message);if(button)button.disabled=false}}};


 window.openAdmin=()=>{
  window.showModal('<div class="auth-box"><h2>ورود مدیریت سروری</h2><div class="notice">دسترسی مدیریت با حساب ADMIN یا OPERATOR کنترل می‌شود.</div><form id="apiAdminLogin"><div class="field"><label>ایمیل یا شناسه مدیر</label><input name="identifier" required></div><div class="field"><label>رمز عبور</label><input name="password" type="password" required></div><button class="btn yellow">ورود امن</button></form></div>');
  document.querySelector('#apiAdminLogin').onsubmit=async e=>{e.preventDefault();const f=e.target,b=f.querySelector('button'),d=Object.fromEntries(new FormData(f));b.disabled=true;try{const result=await api('/api/auth/login',{method:'POST',auth:false,body:d});if(!['ADMIN','OPERATOR'].includes(result.user.role))throw new Error('این حساب دسترسی مدیریت ندارد.');localStorage.setItem(TOKEN_KEY,result.token);localStorage.setItem(USER_KEY,JSON.stringify(result.user));await renderAdminOrders()}catch(err){window.toast(err.message);b.disabled=false}};
 };
 const orderStatusNext = status => ({PENDING:['CONFIRMED','CANCELLED'],CONFIRMED:['PROCESSING','CANCELLED'],PROCESSING:['SHIPPED','CANCELLED'],SHIPPED:['DELIVERED'],DELIVERED:[],CANCELLED:[]}[status]||[]);
 const orderStatusLabel = status => ({PENDING:'در انتظار',CONFIRMED:'تأیید شده',PROCESSING:'در حال پردازش',SHIPPED:'ارسال شده',DELIVERED:'تحویل شده',CANCELLED:'لغو شده'}[status]||status);
 const orderStatusOptions = status => [status,...orderStatusNext(status)].map(s=>'<option value="'+s+'">'+orderStatusLabel(s)+'</option>').join('');
  async function renderAdminOrders(){try{const data=await api('/api/admin/orders');window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · SECURE ADMIN</div><h3>مدیریت سفارش‌ها ('+data.items.length+')</h3></div><button class="mini red" onclick="logoutAccount()">خروج</button></div><div style="display:flex;gap:8px;flex-wrap:wrap;margin:12px 0"><button class="btn yellow" onclick="window.renderAdminProducts()">مدیریت کالاها / Excel</button><button class="btn dark" onclick="window.renderAdminCustomers()">مدیریت کاربران</button><button class="btn dark" onclick="window.renderAdminQuotes()">مدیریت استعلام‌ها</button><button class="btn dark" onclick="window.renderAdminInventoryMovements()">گردش موجودی انبار</button></div><div class="table-wrap"><table><thead><tr><th>شماره سفارش</th><th>مشتری</th><th>مبلغ (ریال)</th><th>وضعیت</th><th>شرکت حمل</th><th>شماره رهگیری</th><th>عملیات</th></tr></thead><tbody>'+data.items.map(o=>'<tr><td dir="ltr">'+escHtml(o.orderNumber)+'</td><td>'+escHtml(o.user.displayName||'')+'<br>'+escHtml(o.user.identifier||'')+'</td><td>'+Number(o.totalIrr).toLocaleString('fa-IR')+'</td><td>'+escHtml(o.status)+'</td><td><input aria-label="شرکت حمل" placeholder="شرکت حمل" maxlength="100" data-carrier="'+escHtml(o.orderNumber)+'" value="'+escHtml(o.shippingCarrier||'')+'" style="width:110px"></td><td><input aria-label="شماره رهگیری" placeholder="شماره رهگیری" maxlength="100" data-tracking="'+escHtml(o.orderNumber)+'" value="'+escHtml(o.trackingNumber||'')+'" style="width:130px"></td><td><select data-status="'+escHtml(o.orderNumber)+'">'+orderStatusOptions(o.status)+'</select><button class="mini" data-save-status="'+o.orderNumber+'">ثبت وضعیت</button><button class="mini" data-save-shipping="'+escHtml(o.orderNumber)+'">ثبت رهگیری</button></td></tr>').join('')+'</tbody></table></div>');if(JSON.parse(localStorage.getItem(USER_KEY)||'{}').role!=='ADMIN'){document.querySelectorAll('button[onclick="window.renderAdminProducts()"],button[onclick="window.renderAdminCustomers()"],button[onclick="window.renderAdminInventoryMovements()"]').forEach(b=>b.remove())}document.querySelectorAll('[data-status]').forEach(x=>x.value=data.items.find(o=>o.orderNumber===x.dataset.status)?.status||'PENDING');document.querySelectorAll('[data-save-status]').forEach(b=>b.onclick=async()=>{try{const id=b.dataset.saveStatus,status=document.querySelector('[data-status="'+id+'"]').value;await api('/api/admin/orders/'+encodeURIComponent(id)+'/status',{method:'PATCH',body:{status}});window.toast('وضعیت سفارش به‌روزرسانی شد.');await renderAdminOrders()}catch(e){window.toast(e.message)}});document.querySelectorAll('[data-save-shipping]').forEach(b=>b.onclick=async()=>{try{const id=b.dataset.saveShipping,carrier=document.querySelector('[data-carrier="'+id+'"]').value.trim(),trackingNumber=document.querySelector('[data-tracking="'+id+'"]').value.trim();await api('/api/admin/orders/'+encodeURIComponent(id)+'/shipping',{method:'PATCH',body:{carrier,trackingNumber}});window.toast('اطلاعات رهگیری ذخیره شد.');await renderAdminOrders()}catch(e){window.toast(e.message)}})}catch(e){window.toast(e.message)}}

 window.renderAdminOrders=renderAdminOrders;

 window.renderAdminInventoryMovements=async()=>{
  try{
   const data=await api('/api/admin/inventory/movements');
   const labels={IN:'ورود',OUT:'خروج',ADJUSTMENT:'اصلاح موجودی',ORDER:'ثبت سفارش',CANCELLATION:'لغو سفارش'};
   const rows=data.items||[];
   window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · INVENTORY LEDGER</div><h3>دفتر گردش موجودی ('+rows.length+')</h3><small>آخرین ۳۰۰ تغییر ثبت‌شده · فقط خواندنی</small></div><button class="mini" onclick="window.renderAdminOrders()">بازگشت</button></div>'+
    (rows.length?'<div class="table-wrap"><table><thead><tr><th>تاریخ</th><th>کد کالا</th><th>نام کالا</th><th>نوع گردش</th><th>تغییر</th><th>قبل</th><th>بعد</th><th>مرجع</th></tr></thead><tbody>'+rows.map(m=>'<tr><td>'+new Date(m.createdAt).toLocaleString('fa-IR')+'</td><td dir="ltr">'+escHtml(m.sku)+'</td><td>'+escHtml(m.productName)+'</td><td>'+labels[m.movementType]+'</td><td dir="ltr">'+(m.quantityDelta>0?'+':'')+m.quantityDelta+'</td><td>'+m.stockBefore+'</td><td>'+m.stockAfter+'</td><td dir="ltr">'+escHtml(m.reference||'—')+'</td></tr>').join('')+'</tbody></table></div>':'<div class="notice">هنوز تغییری در موجودی ثبت نشده است. از این پس تغییر موجودی کالاها، سفارش‌ها و لغو سفارش‌ها در این دفتر ثبت می‌شود.</div>'));
  }catch(err){window.toast(err.message)}
 };

 window.renderAdminCustomers=async()=>{
  try{
   const data=await api('/api/admin/customers');
   window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · CUSTOMERS</div><h3>مدیریت کاربران ('+data.items.length+')</h3></div><button class="mini" onclick="window.renderAdminOrders()">بازگشت</button></div><div class="table-wrap"><table><thead><tr><th>نام</th><th>شناسه</th><th>تاریخ عضویت</th><th>وضعیت</th><th>عملیات</th></tr></thead><tbody>'+data.items.map(u=>'<tr><td>'+escHtml(u.displayName)+'</td><td>'+escHtml(u.identifier)+'</td><td>'+new Date(u.createdAt).toLocaleDateString('fa-IR')+'</td><td>'+(u.isActive?'فعال':'مسدود')+'</td><td><button class="mini" data-user-active="'+u.id+'" data-active="'+(!u.isActive)+'">'+(u.isActive?'مسدود کردن':'فعال‌سازی')+'</button></td></tr>').join('')+'</tbody></table></div>');
   document.querySelectorAll('[data-user-active]').forEach(b=>b.onclick=async()=>{try{await api('/api/admin/customers/'+b.dataset.userActive+'/active',{method:'PATCH',body:{isActive:b.dataset.active==='true'}});window.toast('وضعیت کاربر تغییر کرد.');await window.renderAdminCustomers()}catch(err){window.toast(err.message)}});
  }catch(err){window.toast(err.message)}
 };
 window.renderAdminQuotes=async()=>{
  try{
   const data=await api('/api/admin/quotes');
   window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · QUOTES</div><h3>مدیریت استعلام‌ها ('+data.items.length+')</h3></div><button class="mini" onclick="window.renderAdminOrders()">بازگشت</button></div><div class="table-wrap"><table><thead><tr><th>شماره</th><th>مشتری / تماس</th><th>کد کالا</th><th>شرح درخواست</th><th>وضعیت</th><th>عملیات</th></tr></thead><tbody>'+data.items.map(q=>'<tr><td dir="ltr">'+escHtml(q.quoteNumber)+'</td><td>'+escHtml(q.name)+'<br>'+escHtml(q.phone)+'</td><td>'+escHtml(q.productSku||'—')+'</td><td>'+escHtml(q.message)+'</td><td>'+escHtml(q.status)+'</td><td><select data-quote-status="'+escHtml(q.quoteNumber)+'"><option value="NEW">جدید</option><option value="CONTACTED">پیگیری شد</option><option value="CLOSED">بسته شد</option></select><button class="mini" data-quote-save="'+escHtml(q.quoteNumber)+'">ثبت</button></td></tr>').join('')+'</tbody></table></div>');
   document.querySelectorAll('[data-quote-status]').forEach(x=>x.value=data.items.find(q=>q.quoteNumber===x.dataset.quoteStatus)?.status||'NEW');
   document.querySelectorAll('[data-quote-save]').forEach(b=>b.onclick=async()=>{try{const id=b.dataset.quoteSave,status=document.querySelector('[data-quote-status="'+id+'"]').value;await api('/api/admin/quotes/'+encodeURIComponent(id)+'/status',{method:'PATCH',body:{status}});window.toast('وضعیت استعلام ذخیره شد.')}catch(err){window.toast(err.message)}});
  }catch(err){window.toast(err.message)}
 };

 function openProductEditor(p){
  if(!p)return;
  window.showModal('<div class="auth-box"><h3>ویرایش کالا · '+escHtml(p.sku)+'</h3><form id="amootProductEdit"><div class="form-grid">'+
   '<div class="field"><label>نام کالا</label><input name="name" required maxlength="180" value="'+escHtml(p.name)+'"></div>'+
   '<div class="field"><label>برند</label><input name="brand" maxlength="100" value="'+escHtml(p.brand||'')+'"></div>'+
   '<div class="field"><label>دسته‌بندی</label><input name="category" required maxlength="100" value="'+escHtml(p.category)+'"></div>'+
   '<div class="field"><label>مدل دستگاه</label><input name="machineModel" maxlength="120" value="'+escHtml(p.machineModel||'')+'"></div>'+
   '<div class="field"><label>قیمت (ریال؛ خالی = استعلام)</label><input name="priceIrr" inputmode="numeric" value="'+escHtml(p.priceIrr||'')+'"></div>'+
   '<div class="field"><label>موجودی انبار</label><input name="stock" type="number" min="0" max="10000000" step="1" required value="'+Number(p.stock||0)+'"></div>'+
   '<div class="field"><label>نشانی تصویر</label><input name="imageUrl" maxlength="1000" value="'+escHtml(p.imageUrl||'')+'"></div>'+
   '<div class="field" style="grid-column:1/-1"><label>توضیحات</label><textarea name="description" maxlength="2000">'+escHtml(p.description||'')+'</textarea></div>'+
   '</div><button class="btn yellow" type="submit">ذخیره تغییرات</button><p class="auth-foot" id="amootProductEditMessage"></p></form></div>');
  document.querySelector('#amootProductEdit').onsubmit=async e=>{
   e.preventDefault();const form=e.currentTarget,button=form.querySelector('button[type=submit]'),message=document.querySelector('#amootProductEditMessage'),d=Object.fromEntries(new FormData(form));
   d.stock=Number(d.stock);d.priceIrr=d.priceIrr.trim();
   if(d.priceIrr!==''&&!/^\\d+$/.test(d.priceIrr)){message.textContent='قیمت باید عدد صحیح ریالی باشد.';return}
   button.disabled=true;message.textContent='در حال ذخیره...';
   try{await api('/api/admin/products/'+encodeURIComponent(p.sku),{method:'PATCH',body:d});window.toast('اطلاعات کالا و موجودی ذخیره شد.');await window.renderAdminProducts()}
   catch(err){message.textContent=err.message;button.disabled=false}
  };
 }

 window.renderAdminReceipts=async()=>{
  try{
   const data=await api('/api/admin/inventory/receipts');
   window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · WAREHOUSE</div><h3>رسید ورود کالا به انبار</h3><small>ثبت رسید به‌صورت تراکنشی موجودی و دفتر گردش را هم‌زمان به‌روزرسانی می‌کند.</small></div><button class="mini" onclick="window.renderAdminProducts()">بازگشت</button></div>'+
    '<form id="amootReceiptForm"><div class="form-grid"><div class="field"><label>تأمین‌کننده</label><input name="supplier" maxlength="160" placeholder="نام فروشنده / تأمین‌کننده"></div><div class="field"><label>شماره فاکتور یا سند</label><input name="documentNumber" maxlength="100"></div></div>'+
    '<div class="field"><label>اقلام رسید (هر خط: کد کالا, تعداد)</label><textarea name="lines" rows="6" required placeholder="CAT-FILTER-001, 12&#10;KOM-ROLLER-02, 4"></textarea></div>'+
    '<div class="field"><label>توضیحات</label><input name="note" maxlength="1000"></div><button class="btn yellow" type="submit">ثبت رسید و افزایش موجودی</button><p id="amootReceiptMessage" class="auth-foot"></p></form>'+
    '<h4>۱۰۰ رسید اخیر</h4>'+(data.items.length?'<div class="customer-list">'+data.items.map(r=>'<article><b>'+escHtml(r.receiptNumber)+' · '+escHtml(r.supplier||'بدون نام تأمین‌کننده')+'</b><small>'+new Date(r.createdAt).toLocaleString('fa-IR')+' · سند: '+escHtml(r.documentNumber||'—')+'</small><small>'+r.items.map(i=>escHtml(i.sku)+' × '+Number(i.quantity).toLocaleString('fa-IR')).join('، ')+'</small></article>').join('')+'</div>':'<div class="empty-state">هنوز رسیدی ثبت نشده است.</div>'));
   document.querySelector('#amootReceiptForm').onsubmit=async e=>{
    e.preventDefault();const form=e.currentTarget,button=form.querySelector('button[type=submit]'),msg=document.querySelector('#amootReceiptMessage'),d=Object.fromEntries(new FormData(form));
    const items=d.lines.split(/\\r?\\n/).map(line=>line.trim()).filter(Boolean).map(line=>{const parts=line.split(/[;,\\t]/).map(x=>x.trim());return {sku:parts[0],quantity:Number(parts[1])}});
    if(!items.length||items.some(x=>!x.sku||!Number.isInteger(x.quantity)||x.quantity<1)){msg.textContent='فرمت اقلام معتبر نیست؛ هر خط باید به شکل SKU, تعداد باشد.';return}
    button.disabled=true;msg.textContent='در حال ثبت رسید و به‌روزرسانی موجودی...';
    try{const result=await api('/api/admin/inventory/receipts',{method:'POST',body:{supplier:d.supplier,documentNumber:d.documentNumber,note:d.note,items}});window.toast('رسید '+result.receiptNumber+' ثبت شد؛ موجودی و دفتر گردش به‌روزرسانی شدند.');await window.renderAdminReceipts()}
    catch(err){msg.textContent=err.message;button.disabled=false}
   };
  }catch(err){window.toast(err.message)}
 };

 window.renderAdminLowStock=async()=>{
  try{
   const thresholdRaw=prompt('حد هشدار موجودی را به تعداد عددی وارد کنید:','5');
   if(thresholdRaw===null)return;
   const threshold=Number(thresholdRaw);
   if(!Number.isInteger(threshold)||threshold<0||threshold>1000000){window.toast('حد هشدار باید عدد صحیح نامنفی باشد.');return}
   const data=await api('/api/admin/inventory/low-stock?threshold='+encodeURIComponent(threshold));
   const rows=data.items||[];
   window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · INVENTORY ALERT</div><h3>گزارش کمبود موجودی</h3><small>حد هشدار: '+threshold.toLocaleString('fa-IR')+' عدد · '+rows.length.toLocaleString('fa-IR')+' کالا</small></div><button class="mini" onclick="window.renderAdminProducts()">بازگشت</button></div>'+
    (rows.length?'<div class="table-wrap"><table><thead><tr><th>کد کالا</th><th>نام کالا</th><th>برند</th><th>دسته‌بندی</th><th>موجودی</th></tr></thead><tbody>'+rows.map(p=>'<tr><td dir="ltr">'+escHtml(p.sku)+'</td><td>'+escHtml(p.name)+'</td><td>'+escHtml(p.brand||'—')+'</td><td>'+escHtml(p.category)+'</td><td><strong style="color:'+(Number(p.stock)===0?'#b42318':'#9a6700')+'">'+Number(p.stock).toLocaleString('fa-IR')+'</strong></td></tr>').join('')+'</tbody></table></div>':'<div class="empty-state">در حال حاضر کالای فعالی با موجودی کمتر یا مساوی حد هشدار وجود ندارد.</div>'));
  }catch(err){window.toast(err.message)}
 };

 window.renderAdminProducts=async()=>{
  try{
   const data=await api('/api/admin/products');
   window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · CATALOG</div><h3>مدیریت کالاها ('+data.items.length+')</h3></div><button class="mini" onclick="window.renderAdminOrders()">بازگشت به سفارش‌ها</button></div><div class="notice">فایل Excel با ستون‌های SKU، Name، Category، PriceIrr، Stock، Brand، MachineModel، Description، ImageUrl و Status قابل ورود است. کالاهای دارای SKU تکراری به‌روزرسانی می‌شوند.</div><div class="notice"><b>کاتالوگ پارت‌نامبر Caterpillar:</b> فایل جداگانه با ستون‌های PartNumber، Name، EngineModels، TechnicalGroup، SourceName و SourceUrl را وارد کنید. این رکوردها موجودی فروشگاهی محسوب نمی‌شوند و فقط برای جست‌وجو و استعلام هستند.</div><div class="field"><label>فایل پارت‌نامبر Caterpillar (Excel/CSV)</label><input id="amootPartCatalogFile" type="file" accept=".xlsx,.xls,.csv"></div><button class="btn dark" id="amootImportPartCatalog" type="button">ورود پارت‌نامبرها به کاتالوگ</button><p id="amootPartImportMessage" class="auth-foot">حداکثر ۵۰۰ ردیف در هر بار؛ منبع هر ردیف الزامی است.</p><div class="notice"><b>ورود شواهد K-Part:</b> داده‌های این بخش فقط مرجع اولیه‌اند و به کاتالوگ قطعات تأییدشده یا موجودی فروشگاه منتقل نمی‌شوند. مدل و پیشوند سریال برای هر ردیف الزامی است.</div><div class="field"><label>فایل شواهد K-Part (Excel/CSV)</label><input id="amootKpartFile" type="file" accept=".xlsx,.xls,.csv"></div><button class="btn dark" id="amootImportKpart" type="button">ثبت مراجع K-Part</button><p id="amootKpartMessage" class="auth-foot">ستون‌ها: PartNumber، Name، ModelName، SerialPrefix، GroupName، DiagramRef، Quantity، SourceUrl، SourceNote.</p><div class="field"><label>انتخاب فایل Excel یا CSV</label><input id="amootProductFile" type="file" accept=".xlsx,.xls,.csv"></div><button class="btn yellow" id="amootImportProducts">ورود گروهی کالاها</button><button class="btn dark" type="button" onclick="window.renderAdminLowStock()">گزارش کمبود موجودی</button><button class="btn dark" type="button" onclick="window.renderAdminReceipts()">ثبت رسید ورود کالا</button><p id="amootImportMessage" class="auth-foot">حداکثر ۵۰۰ ردیف در هر بار.</p><div class="table-wrap" style="margin-top:16px"><table><thead><tr><th>کد کالا</th><th>نام</th><th>دسته</th><th>قیمت (ریال)</th><th>موجودی</th><th>وضعیت</th></tr></thead><tbody>'+data.items.map(p=>'<tr><td dir="ltr">'+escHtml(p.sku)+'</td><td>'+escHtml(p.name)+'</td><td>'+escHtml(p.category)+'</td><td>'+ (p.priceIrr?Number(p.priceIrr).toLocaleString('fa-IR'):'استعلام')+'</td><td>'+Number(p.stock).toLocaleString('fa-IR')+'</td><td><select data-product-status="'+escHtml(p.sku)+'"><option value="ACTIVE">فعال</option><option value="INACTIVE">غیرفعال</option><option value="ARCHIVED">بایگانی</option></select><button class="mini" data-product-edit="'+escHtml(p.sku)+'" type="button">ویرایش</button></td></tr>').join('')+'</tbody></table></div>');
   document.querySelectorAll('[data-product-status]').forEach(x=>{const p=data.items.find(v=>v.sku===x.dataset.productStatus);x.value=p?.status||'ACTIVE';x.onchange=async()=>{try{await api('/api/admin/products/'+encodeURIComponent(x.dataset.productStatus)+'/status',{method:'PATCH',body:{status:x.value}});window.toast('وضعیت کالا ذخیره شد.')}catch(err){window.toast(err.message)}}});
   document.querySelectorAll('[data-product-edit]').forEach(b=>b.onclick=()=>openProductEditor(data.items.find(p=>p.sku===b.dataset.productEdit)));

   document.querySelector('#amootImportProducts').onclick=async()=>{
    const file=document.querySelector('#amootProductFile').files[0],msg=document.querySelector('#amootImportMessage'),btn=document.querySelector('#amootImportProducts');
    if(!file){msg.textContent='ابتدا فایل را انتخاب کنید.';return}
    btn.disabled=true;msg.textContent='در حال خواندن فایل...';
    try{
     if(!window.XLSX){await new Promise((resolve,reject)=>{const s=document.createElement('script');s.src='https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js';s.onload=resolve;s.onerror=reject;document.head.appendChild(s)})}
     const bytes=await file.arrayBuffer(),book=window.XLSX.read(bytes,{type:'array'}),sheet=book.Sheets[book.SheetNames[0]],raw=window.XLSX.utils.sheet_to_json(sheet,{defval:''});
     const alias={sku:['sku','کد کالا','کد'],name:['name','نام کالا','نام'],brand:['brand','برند'],category:['category','دسته','دسته بندی','دسته‌بندی'],machineModel:['machinemodel','machine_model','مدل دستگاه'],description:['description','توضیحات'],imageUrl:['imageurl','image_url','آدرس تصویر'],priceIrr:['priceirr','price_irr','قیمت ریال','قیمت'],stock:['stock','موجودی'],status:['status','وضعیت']};
     const norm=s=>String(s??'').trim().toLowerCase().replace(/[ _-]/g,'');
     const items=raw.map(row=>{const keys=Object.keys(row),o={};for(const [field,names] of Object.entries(alias)){const k=keys.find(x=>names.map(norm).includes(norm(x)));o[field]=k===undefined?'':row[k]}return o}).filter(x=>x.sku||x.name);
     if(!items.length)throw new Error('ردیف معتبر پیدا نشد؛ نام ستون‌ها را بررسی کنید.');
     const result=await api('/api/admin/products/import',{method:'POST',body:{items}});
     msg.textContent=result.imported+' کالا با موفقیت ثبت/به‌روزرسانی شد.';window.toast('ورود کالاها انجام شد.');await window.renderAdminProducts();
    }catch(err){msg.textContent=err.message;btn.disabled=false}
   };
   document.querySelector('#amootImportPartCatalog').onclick=async()=>{
    const file=document.querySelector('#amootPartCatalogFile').files[0],msg=document.querySelector('#amootPartImportMessage'),btn=document.querySelector('#amootImportPartCatalog');
    if(!file){msg.textContent='ابتدا فایل پارت‌نامبر را انتخاب کنید.';return}
    btn.disabled=true;msg.textContent='در حال خواندن کاتالوگ...';
    try{
     if(!window.XLSX){await new Promise((resolve,reject)=>{const sc=document.createElement('script');sc.src='https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js';sc.onload=resolve;sc.onerror=reject;document.head.appendChild(sc)})}
     const book=window.XLSX.read(await file.arrayBuffer(),{type:'array'}),sheet=book.Sheets[book.SheetNames[0]],raw=window.XLSX.utils.sheet_to_json(sheet,{defval:''});
     const aliases={partNumber:['partnumber','part_number','part no','partno','شماره قطعه','پارت نامبر'],name:['name','part name','نام قطعه','شرح'],engineModels:['enginemodels','engine_models','engine model','مدل موتور'],technicalGroup:['technicalgroup','technical_group','group','گروه فنی'],description:['description','توضیحات'],sourceName:['sourcename','source_name','source','منبع'],sourceUrl:['sourceurl','source_url','url','آدرس منبع'],sourceNote:['sourcenote','source_note','یادداشت منبع'],verificationStatus:['verificationstatus','verification_status','وضعیت تأیید']};
     const norm=x=>String(x??'').trim().toLowerCase().replace(/[ _-]/g,'');
     const items=raw.map(row=>{const keys=Object.keys(row),o={};for(const [field,names] of Object.entries(aliases)){const k=keys.find(x=>names.map(norm).includes(norm(x)));o[field]=k===undefined?'':row[k]}return o}).filter(x=>x.partNumber&&x.name);
     if(!items.length)throw new Error('هیچ ردیف معتبری پیدا نشد؛ ستون‌های فایل را بررسی کنید.');
     const result=await api('/api/admin/parts/import',{method:'POST',body:{items}});
     msg.textContent=result.imported+' پارت‌نامبر ثبت یا به‌روزرسانی شد.';window.toast('کاتالوگ پارت‌نامبر وارد شد.');
    }catch(err){msg.textContent=err.message;btn.disabled=false}
   };
   document.querySelector('#amootImportKpart').onclick=async()=>{
    const file=document.querySelector('#amootKpartFile').files[0],msg=document.querySelector('#amootKpartMessage'),btn=document.querySelector('#amootImportKpart');
    if(!file){msg.textContent='ابتدا فایل شواهد K-Part را انتخاب کنید.';return}
    btn.disabled=true;msg.textContent='در حال بررسی و ثبت شواهد...';
    try{
     if(!window.XLSX){await new Promise((resolve,reject)=>{const sc=document.createElement('script');sc.src='https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js';sc.onload=resolve;sc.onerror=reject;document.head.appendChild(sc)})}
     const book=window.XLSX.read(await file.arrayBuffer(),{type:'array'}),sheet=book.Sheets[book.SheetNames[0]],raw=window.XLSX.utils.sheet_to_json(sheet,{defval:''});
     const aliases={partNumber:['partnumber','part_number','part no','شماره قطعه','پارت نامبر'],name:['name','part name','نام قطعه','شرح'],modelName:['modelname','model_name','model','مدل دستگاه'],serialPrefix:['serialprefix','serial_prefix','prefix','پیشوند سریال'],groupName:['groupname','group_name','group','گروه قطعه'],diagramRef:['diagramref','diagram_ref','diagram','شماره شکل'],quantity:['quantity','qty','تعداد'],sourceUrl:['sourceurl','source_url','url','آدرس منبع'],sourceNote:['sourcenote','source_note','یادداشت منبع']};
     const norm=x=>String(x??'').trim().toLowerCase().replace(/[ _-]/g,'');
     const items=raw.map(row=>{const keys=Object.keys(row),o={};for(const [field,names] of Object.entries(aliases)){const k=keys.find(x=>names.map(norm).includes(norm(x)));o[field]=k===undefined?'':row[k]}return o}).filter(x=>x.partNumber&&x.name);
     if(!items.length)throw new Error('ردیف معتبر پیدا نشد؛ ستون‌های فایل را بررسی کنید.');
     const result=await api('/api/admin/kpart/import',{method:'POST',body:{items}});
     msg.textContent=result.imported+' مرجع K-Part ثبت شد؛ وضعیت همه ردیف‌ها CANDIDATE است.';window.toast('مراجع K-Part ثبت شد.');btn.disabled=false;
    }catch(err){msg.textContent=err.message;btn.disabled=false}
   };
  }catch(err){window.toast(err.message)}
 };

 const oldLogout=window.logoutAccount;
 window.logoutAccount=()=>{localStorage.removeItem(TOKEN_KEY);localStorage.removeItem(USER_KEY);oldLogout?.()};
 const oldLoadProducts=window.loadProducts;
 window.loadProducts=async()=>{try{
  const params=new URLSearchParams(),q=document.querySelector('#search')?.value||'',category=document.querySelector('.cat.active')?.dataset.cat||document.querySelector('#quickCategory')?.value||'',brand=document.querySelector('#brandFilter')?.value||'',model=document.querySelector('#modelFilter')?.value||'';
  if(q)params.set('q',q);if(category)params.set('category',category);if(brand)params.set('brand',brand);if(model)params.set('model',model);
  const data=await api('/api/products?'+params.toString(),{auth:false});
  const rows=Array.isArray(data.items)?data.items:[];
  const offRoadPriceRows=[
 ["3368670","HUB AS.",8099.28,13363.81,"۳۲ New Aftermarket"],
 ["3383454","MOTOR GP-E",1714.16,2828.36,"۱۲۰ New Aftermarket"],
 ["3383456","MOTOR GP-E",1714.16,2828.36,"۳۹ New Aftermarket"],
 ["3410597","FRAME AS",5266.66,8689.99,"۱ New Aftermarket"],
 ["3412182","CYL GP-SEA",13147.50,21693.38,"۱ New Aftermarket"],
 ["3348389","CRANKSHAFT",8521.82,14061.00,"۱۵۰ New Aftermarket؛ ۱ Used"],
 ["3356220","HEAD GP-CY",2886.52,4762.76,"۲ New Genuine Surplus؛ ۱ New Aftermarket"],
 ["3356352","SUSPENSION",60580.91,99958.50,"۲ New Aftermarket؛ ۱ New Genuine Surplus؛ ۲ Call For Pricing"],
 ["3362213","PUMP GP-WA",1748.81,2885.54,"۸ New Aftermarket"],
 ["3365750","DRIVE GP-F",44524.81,73465.94,"۶ New Aftermarket؛ ۱ Rebuilt"],
 ["3320045","TURBO GP-B",5257.97,8675.65,"۷ New Aftermarket؛ ۱ Call For Pricing"],
 ["3320046","TURBO GP-B",5257.97,8675.65,"۲ New Aftermarket؛ ۱ Call For Pricing"],
 ["3327297","CAMSHAFT",2467.04,4070.62,"۵۰ New Aftermarket"],
 ["3327298","CAMSHAFT",2467.04,4070.62,"۵۴ New Aftermarket؛ ۱ Used"],
 ["3331184","ALTERNATOR",1535.35,2533.33,"۸ New Aftermarket"],
 ["3231170","IDLER GP-T",2382.20,3930.63,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["3238674","GEAR-WORM",2103.74,3471.17,"۶۱ New Aftermarket"],
 ["3240532","PUMP GP-FU",3965.16,6542.51,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["3161079","FRAME AS",3168.26,5227.63,"۵۱ New Aftermarket"],
 ["3167251","ALTERNATOR",1674.51,2762.94,"۲۴ New Aftermarket؛ ۸ Call For Pricing"],
 ["3172440","HEAD GP-CY",2815.49,4645.56,"۱۱ New Aftermarket؛ ۱ New Genuine Surplus؛ ۱۲ New Genuine - Less Than Perfect"],
 ["3178021","PUMP GP FU",3945.46,6510.01,"۱۰ New Aftermarket"],
 ["3178766","BEARING -",75.33,124.29,"۵٬۳۲۵ New Aftermarket؛ ۱ New Genuine Surplus؛ ۱۷ Call For Pricing"],
 ["3144126","SEAL GP-DU",1436.31,2369.91,"۱۴ New Aftermarket"],
 ["3144128","SEAL GP-DU",1338.45,2208.44,"۲۳ New Aftermarket"],
 ["3144130","SEAL GP-DU",2646.78,4367.19,"۷۱ New Aftermarket"],
 ["3145005","PISTON AS",1711.01,2823.17,"۳۶۶ New Aftermarket"],
 ["3147755","REGULATOR",2919.33,4816.89,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["3073993","CONT GP-HA",2836.28,4679.86,"۲۳ New Aftermarket"],
 ["3109354","CONTROL GP",1368.74,2258.42,"۱۱ New Aftermarket"],
 ["3119541","PUMP GP-2P",35559.89,58673.82,"۴ New Aftermarket"],
 ["3133997","CRANKSHAFT",9435.97,15569.35,"۴۰ New Aftermarket"],
 ["3137770","PUMP GP-F XF",1370.34,2261.06,"۲۸ New Genuine Surplus؛ ۱۱۶ New Aftermarket؛ ۱ Used"],
 ["3050324","COMPRESSOR",1377.77,2273.32,"۴۶ New Aftermarket"],
 ["3050325","COMPRESSOR",1377.77,2273.32,"۱ New Genuine Surplus؛ ۱۸۳ New Aftermarket"],
 ["3050617","HEAD GP-CY",8064.47,13306.38,"۴۵ New Aftermarket"],
 ["3058141","BLOCK GP-C",8677.41,14317.73,"۱ New Aftermarket"],
 ["3073063","PUMP GP-PS",4076.87,6726.84,"۹ New Aftermarket"],
 ["2979275","SPRING GP-",7321.76,12080.90,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["2979546","SEAL GP DU",1842.18,3039.60,"۴ New Genuine Surplus"],
 ["2995204","PISTON AS",1685.66,2781.34,"۲۵۴ New Aftermarket؛ ۱۴ Used"],
 ["2995344","YOKE",3600.43,5940.71,"۳ New Aftermarket"],
 ["2995840","CONT GP-XM",1345.02,2219.28,"۲ New Aftermarket"],
 ["2929964","PUMP GP",4842.40,7989.96,"۲۶ New Aftermarket؛ ۱ Call For Pricing؛ ۱ Used"],
 ["2935712","CYL GP-065",1468.07,2422.32,"۲۷ New Aftermarket"],
 ["2976876","KIT-GASKET",2354.18,3884.40,"۱۱ New Aftermarket"],
 ["2979150","ADJUST GP",2432.63,4013.84,"۵۳ New Aftermarket"],
 ["2979151","ADJUST GP",2576.21,4250.75,"۵۶ New Aftermarket؛ ۲ Used"],
 ["2807864","MOTOR GP P",5545.01,9149.27,"۲ New Aftermarket"],
 ["2818491","BAR GP-EQU",12878.29,21249.18,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["2818870","KIT-GASKET",2279.40,3761.01,"۳۴ New Aftermarket"],
 ["2850852","TRUNNION",1294.11,2135.28,"۵۷ New Aftermarket؛ ۲ New Genuine Surplus؛ ۱ Call For Pricing؛ ۳ Used"],
 ["2892131","CONE SPL T",1763.56,2909.87,"۴ New Aftermarket"],
 ["2721889","ALTERNATOR",1772.15,2924.05,"۲۰ New Aftermarket"],
 ["2726955","PUMP GP-2P",18866.71,31130.07,"۹ New Aftermarket"],
 ["2730178","GEAR SIDE",3287.38,5424.18,"۱ New Genuine Surplus؛ ۱۱ New Aftermarket"],
 ["2776918","ACTUATOR",1310.51,2162.34,"۲۳ New Aftermarket"],
 ["2807374","PUMP GP-WA",1748.81,2885.54,"۳۵۳ New Aftermarket"],
 ["2612208","CONTROL GP",1442.07,2379.42,"۱۳۳ New Aftermarket"],
 ["2635055","HEAD GP BA",10115.35,16690.33,"۱۵ New Aftermarket؛ ۱ Used"],
 ["2652299","DRIVE GP-F",31464.31,51916.11,"۲ New Aftermarket؛ ۱ Call For Pricing؛ ۵ Rebuilt"],
 ["2672755","PUMP GP-PS",5007.90,8263.03,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["2701763","PUMP GP-GE",4973.36,8206.04,"۵ New Aftermarket"],
 ["2602160","MONITOR GP",3277.02,5407.08,"۴ New Aftermarket"],
 ["2602289","LINK AS-BR",3483.97,5748.55,"۳۱ New Aftermarket"],
 ["2606642","SPINDLE",5730.57,9455.44,"۴ New Aftermarket"],
 ["2606650","DRIVE GP-F",30180.50,49797.83,"۲ New Aftermarket؛ ۵ Rebuilt"],
 ["2606655","DRIVE GP-F",29770.37,49121.11,"۳ New Aftermarket؛ ۱ Rebuilt"],
 ["2525165","TURBO GP-B",3171.01,5232.17,"۴۴ New Aftermarket"],
 ["2527086","MOUNTING AS-",6611.33,10908.69,"۳ New Aftermarket"],
 ["2531752","PLATE-THRU",51.40,84.81,"۲۱۸ New Aftermarket"],
 ["2543025","LINK AS-BR",5827.84,9615.94,"۵ New Aftermarket؛ ۱ Used"],
 ["2507700","TURBO GP-B",4293.96,7085.03,"۲۸ New Aftermarket"],
 ["2512557","PIN",1605.88,2649.70,"۱۴ New Genuine Surplus؛ ۳۲ New Aftermarket؛ ۲ Used"],
 ["2512652","LINK AS-BR",7430.08,12259.63,"۱۵ New Aftermarket"],
 ["2518266","ACCUMULATO",1251.91,2065.65,"۲ New Genuine Surplus؛ ۸ New Aftermarket"],
 ["2490059","COUPLING",7008.33,11563.74,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["2490313","ALTERNATOR",1853.44,3058.18,"۲۶ New Aftermarket"],
 ["2500841","TURBO GP-B",3677.13,6067.26,"۶۷ New Aftermarket؛ ۱ New Genuine Surplus"],
 ["2436650","CIRCLE AS",26574.93,43848.63,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["2443114","VALVE GP-M",336.20,554.73,"۴۷۹ New Aftermarket؛ ۱ New Genuine Surplus؛ ۳ Used"],
 ["2443304","PUMP GP-GR",5877.99,9698.68,"۵ New Aftermarket؛ ۱ Used"],
 ["2475212","MOTOR AS-G",1849.63,3051.89,"۴۲ New Aftermarket"],
 ["2475232","MOTOR AS-G",1582.20,2610.63,"۳۹ New Aftermarket"],
 ["2394322","SPRING G",6971.47,11502.93,"۲۷ New Aftermarket؛ ۲ Used"],
 ["2399988","TURBO GP-B",5536.98,9136.02,"۴۰ New Aftermarket"],
 ["2418686","PUMP GP",1929.16,3183.11,"۷ New Aftermarket"],
 ["2420673","CAMSHAFT A",2102.96,3469.88,"۹ New Aftermarket"],
 ["2357133","ALTERNATOR",1506.03,2484.95,"۵۸ New Aftermarket؛ ۱ New Aftermarket - Less Than Perfect"],
 ["2357636","PIN AS",1977.13,3262.26,"۱۳۷ New Aftermarket؛ ۲ New Genuine Surplus"],
 ["2357642","PIN AS",1607.57,2652.49,"۱۹ New Aftermarket"],
 ["2371962","MOTOR GP-E",1638.98,2704.32,"۸ New Aftermarket"],
 ["2373655","CONT GP",2109.08,3479.98,"۲ New Genuine Surplus"],
 ["2270844","CYL GP-010",7543.33,12446.49,"۱ New Aftermarket"],
 ["2307132","PUMP GP-GR",3719.50,6137.18,"۱۵ New Aftermarket"],
 ["2335220","PUMP GP-BE",1633.01,2694.47,"۳۲۱ New Aftermarket؛ ۲ Used"],
 ["2356501","PUMP GP-GR",1396.47,2304.18,"۱۳۰ New Aftermarket؛ ۱ Used"],
 ["2356823","CYL GP-011",6076.84,10026.79,"۱ Rebuilt"],
 ["2237962","CORE AS.",1853.84,3058.84,"۲۶۸ New Aftermarket"],
 ["2239250","HEAD GP-CY",10065.28,16607.71,"۶۴ New Aftermarket"],
 ["2244122","FRAME AS",14832.96,24474.38,"۱ New Aftermarket"],
 ["2267683","ALTERNATOR",1563.04,2579.02,"۲۹ New Genuine Surplus؛ ۴۴ New Aftermarket"],
 ["2226926","BAR GP-EQU",12873.57,21241.39,"۸ New Aftermarket؛ ۱ Rebuilt"],
 ["2229219","SPINDLE",7014.40,11573.76,"۹ New Aftermarket"],
 ["2231608","PUMP GP-BE",1656.37,2733.01,"۶۸ New Aftermarket؛ ۱ Used"],
 ["2237263","HEAD AS",6842.03,11289.35,"۳۴ New Aftermarket؛ ۸ New Aftermarket Loaded"],
 ["2237468","CAMSHAFT A",3209.05,5294.93,"۴۳ New Aftermarket؛ ۱ Call For Pricing"],
 ["2195847","HEAD GP-CY",5000.52,8250.86,"۱۹ New Aftermarket؛ ۱ Used"],
 ["2223676","BAR GP",24587.40,40569.21,"۱۰ New Aftermarket"],
 ["2225152","KIT-REBUIL",1314.13,2168.31,"۱۵ New Aftermarket"],
 ["2225153","KIT-REBUIL",1271.42,2097.84,"۵۲ New Aftermarket"],
 ["2120403","CONT GP-XMSN",1509.33,2490.39,"۱۲ New Aftermarket"],
 ["2125024","CONE",1791.15,2955.40,"۱ New Genuine Surplus؛ ۳۵ New Aftermarket"],
 ["2128177","PUMP GP-WA",2281.11,3763.83,"۷۲ New Aftermarket؛ ۴ Call For Pricing"],
 ["2135268","MOTOR G",3660.01,6039.02,"۲ New Aftermarket؛ ۳ Call For Pricing"],
 ["2145097","STEERING CYL",1247.99,2059.18,"۶ New Aftermarket"],
 ["2065889","A/C CONDEN",1487.33,2454.09,"۲۵ New Aftermarket"],
 ["2071517","MOTOR G",1519.79,2507.65,"۹۷ New Aftermarket"],
 ["2071556","MOTOR GP-ELE",1552.19,2561.11,"۴۵ New Aftermarket؛ ۱ Used"],
 ["2071560","MOTOR G",1485.78,2451.54,"۷۰ New Aftermarket"],
 ["2114987","MOUNT-SUSP",1517.33,2503.59,"۳۲ New Aftermarket؛ ۲ New Genuine Surplus؛ ۶ Used"],
 ["2024304","IDLER G TRAC",1629.25,2688.26,"۷ New Aftermarket"],
 ["2044995","PUMP GP-GR",2699.69,4454.49,"۸ New Aftermarket"],
 ["2045462","TURBO GP-B",10778.43,17784.41,"۱۱ New Aftermarket"],
 ["2061556","HEAD GP-CY",3033.42,5005.14,"۲۲ New Aftermarket؛ ۱۲ Call For Pricing"],
 ["2065214","SHAFT",27588.46,45520.96,"۳ New Aftermarket"],
 ["1941252","SPRING GP-",10101.24,16667.05,"۱۶ New Aftermarket"],
 ["1956617","PUMP GP-ME",1989.45,3282.59,"۳ New Aftermarket"],
 ["1967795","BRG AS SPL",10764.70,17761.76,"۶ New Aftermarket"],
 ["1978820","ALTERNATOR",1563.04,2579.02,"۶۴ New Aftermarket؛ ۱ Used"],
 ["1873523","CORE AS",3123.08,5153.08,"۲۱ New Aftermarket؛ ۱ Used"],
 ["1879090","PUMP GP-PS-B",2163.16,3569.21,"۲۳ New Aftermarket؛ ۱ Used"],
 ["1883865","TC GP-W/TDR",10015.50,16525.58,"۷ New Aftermarket"],
 ["1888697","BEARING",1846.96,3047.48,"۳۹۹ New Aftermarket؛ ۴ New Genuine Surplus"],
 ["1795922","TURBO GP-BAS",5433.02,8964.48,"۵ New Aftermarket"],
 ["1835296","HEAD GP-CY",10065.28,16607.71,"۲۵۴ New Aftermarket"],
 ["1851016","RADIATOR G",2307.84,3807.94,"۲ New Aftermarket"],
 ["1855294","ALTERNATOR G",1515.46,2500.51,"۶۵ New Aftermarket؛ ۱ New Genuine Surplus"],
 ["1857593","DRIVE GP-FIN",56113.50,92587.28,"۲ New Aftermarket"],
 ["1727766","PUMP GP-WT",1603.90,2646.44,"۲۸۰ New Aftermarket"],
 ["1738612","CYLINDER G",20144.33,33238.14,"۲ New Aftermarket"],
 ["1774651","BAR GP",17513.33,28896.99,"۱۳ New Aftermarket"],
 ["1779953","ALTERNATOR G",1559.51,2573.19,"۲ New Aftermarket؛ ۱ New Genuine Surplus"],
 ["1643692","SENSOR GP-",1248.73,2060.40,"۴ New Genuine Surplus؛ ۶۹ New Aftermarket؛ ۲ Used"],
 ["1658633","CYL GP-0121-",10825.16,17861.51,"در موجودی دقیق فروشنده یافت نشد؛ قیمت OEM List موجود است"],
 ["1592950","SEAT GP-SU",3506.56,5785.82,"۲ New Aftermarket"],
 ["1614110","PUMP GP-EO",2644.35,4363.18,"۶۶ New Aftermarket؛ ۱ Call For Pricing"],
 ["1614111","PUMP GP-EO",2372.23,3914.18,"۷۳ New Aftermarket؛ ۱ New Genuine Surplus؛ ۱ Call For Pricing؛ ۱ Used"],
 ["1614113","PUMP GP-EO",2203.67,3636.06,"۲۳۷ New Aftermarket؛ ۳ Call For Pricing؛ ۱ Used"],
 ["1616634","PUMP GP-PS",5522.61,9112.31,"۶ New Aftermarket"],
 ["1494915","COMPR GP-B",2884.96,4760.18,"۲۶ New Aftermarket"],
 ["1507585","PUMP GP-GR",1951.11,3219.33,"۱۱ New Aftermarket"],
 ["1515911","MANIFOLD A",3953.28,6522.91,"در صفحه عمومی موجودی دقیق یافت نشد"],
 ["1519385","MONITOR GP",3804.27,6277.05,"۹ New Aftermarket؛ ۱ Used"],
 ["1539624","PUMP GP-PS",7781.23,12839.03,"۲ New Aftermarket"],
 ["1417916","CARTRIDGE",2045.66,3375.34,"۱۰ New Aftermarket"],
 ["1440725","ROD AS",2372.57,3914.74,"۱۳۹ New Aftermarket؛ ۱۲ Used"],
 ["1484644","DRIVE GP",19197.19,31675.36,"۱۳ New Aftermarket"],
 ["1003259","PUMP G",4813.76,7942.70,"۲۰ New Aftermarket"],
 ["1005047","ALTERNATOR",695.99,1148.38,"۱ New Genuine Surplus؛ ۱۲ New Aftermarket؛ ۱ Used"],
 ["1007408","CAMSHAFT A",2672.77,4410.07,"۱۰۷ New Aftermarket؛ ۱ Used"],
 ["1041752","PUMP GP",7334.72,12102.29,"۲۷ New Aftermarket؛ ۱ Used"],
 ["1052140","PUMP GP-PS&V",5555.22,9166.11,"۲ New Aftermarket"],
 ["1053196","MOTOR GRP",1493.77,2464.72,"۳ New Aftermarket"],
 ["1053635","PUMP GP",5890.11,9718.68,"۸ New Aftermarket؛ ۵ Used"],
 ["1069872","PUMP GP",6064.01,10005.62,"۵ New Aftermarket"],
 ["1075007","JOINT G-SL",4231.67,6982.26,"۷ New Aftermarket"],
 ["1080850","SHAFT A.",4424.66,7300.69,"۶ New Aftermarket"],
 ["1115059","CORE AS AF",5231.66,8632.24,"۹ New Aftermarket"],
 ["1116841","PUMP GP",4449.49,7341.66,"۱۵ New Aftermarket؛ ۱ Call For Pricing"],
 ["1118181","CYL GP-LIF",13335.42,22003.44,"۳ New Aftermarket؛ ۲ Call For Pricing"],
 ["1125060","BRACKET AS",2364.74,3901.82,"۲۵ New Aftermarket"],
 ["1150637","PUMP",2138.30,3528.20,"۱۱۵ New Aftermarket"],
 ["1154517","CORE A",2137.94,3527.60,"۲ Used"],
 ["1159899","PUMP GP",3457.60,5705.04,"۱۷ New Aftermarket"],
 ["1166562","CORE AS-O.",3078.09,5078.85,"۴۵ New Aftermarket؛ ۱ Used"],
 ["1167885","PAN OIL",2383.69,3933.09,"۲۷ New Aftermarket؛ ۱ Used"],
 ["116-1980","Engine Oil Pump Group",2024.61,3340.61,"۱۵ New Aftermarket؛ ۲ Call For Pricing"],
 ["1168046","BEARING AS",1878.87,3100.14,"۲ New Aftermarket"],
 ["1197698","PUMP G-PS",5671.73,9358.35,"۲ New Aftermarket"],
 ["1245142","CORE A",4125.50,6807.08,"۱۶ New Aftermarket؛ ۳ Call For Pricing؛ ۱ Used"],
 ["1253537","IDLER GP",6223.83,10269.32,"۱ Call For Pricing؛ ۱ Used"],
 ["1275537","CORE AS",2910.79,4802.80,"۹۴ New Aftermarket"],
 ["1291908","CYL GP",8259.50,13628.18,"۲ New Aftermarket"],
 ["1330125","CORE AS",1919.65,3167.42,"۳۹۵ New Aftermarket؛ ۱ Used"],
 ["1331149","PUMP GP",3537.49,5836.86,"۳۲ New Aftermarket"],
 ["1342679","BOGIE AS",11540.01,19041.02,"۳۰ New Aftermarket؛ ۱ Used"],
 ["1342680","BOGIE AS-R",12007.96,19813.13,"۲۸ New Aftermarket"],
 ["1362422","SEE 2394321",2176.47,3591.18,"۱ New Genuine Surplus؛ ۲ Call For Pricing؛ ۳ Used"],
 ["1363965","PUMP GP",1624.27,2680.05,"۶ New Aftermarket؛ ۳ Call For Pricing؛ ۲ Used"],
 ["1392383","PUMP GP",7312.88,12066.25,"۵ New Aftermarket"],
 ["1409699","BAR GP-EQU",17930.99,29586.13,"۱۷ New Aftermarket"],
 ["1414109","CORE A",5631.82,9292.50,"۵۰ New Aftermarket؛ ۲ Call For Pricing"],
 ["5J1193","Bearing",91.15,150.40,"۱۶۲ New Aftermarket"],
 ["5P1948","Cone",2557.93,4220.58,"۱۲ New Aftermarket؛ ۱ New Genuine Surplus؛ ۴ Used"],
 ["2807856","Motor GP-P",5081.35,8384.23,"۷ New Aftermarket"],
 ["2V7390","Shim Pack",60.12,99.20,"۲۸ New Genuine Surplus؛ ۲۰ New Aftermarket"],
 ["1R0751","Filter AS",25.46,42.01,"۳۶۵ New Aftermarket"],
 ["2681900","Pump GP F",943.36,1556.54,"۲ Used"],
 ["8H9789","Bearing",39.16,64.61,"۶۷۰ New Genuine Surplus؛ ۱٬۴۸۴ New Aftermarket"],
 ["6R4385","Wheel A",1430.22,2359.86,"موجودی دقیق شماره یافت نشد"],
 ["2P0220","Gasket",6.67,11.01,"موجودی دقیق شماره یافت نشد؛ گزینه جایگزین جداست"],
 ["0816876","Bolt-PC",27.35,45.13,"موجودی دقیق شماره یافت نشد"],
 ["4619930","Gear-Ring",2145.59,3540.22,"۵۴ New Aftermarket"],
 ["1886126","Gasket",1.18,1.95,"۴۷ New Genuine Surplus؛ ۲٬۳۲۰ New Aftermarket"]
];
  const mapped=rows.map(p=>({id:(()=>{let h=2166136261;for(const ch of String(p.sku||p.id)){h=Math.imul(h^ch.charCodeAt(0),16777619)}return h>>>0})(),serverId:p.id,kind:p.kind||'PRODUCT',sourceUrl:p.sourceUrl||'',sku:p.sku,name:p.name,brand:p.brand||'',category:p.category,technicalGroup:p.technicalGroup||p.category||'',machine_model:p.machineModel||'',description:p.description||'',applicationType:p.applicationType||'UNVERIFIED',applicationEvidence:p.applicationEvidence||'',applicationSourceUrl:p.applicationSourceUrl||'',price:p.priceIrr===null?0:Number(p.priceIrr)/10,price_irr:p.priceIrr,stock:p.stock,image:(typeof p.imageUrl==='string'&&(p.imageUrl.startsWith('https://')||p.imageUrl.startsWith('http://')||p.imageUrl.startsWith('data:image/')||p.imageUrl.startsWith('./assets/')||p.imageUrl.startsWith('/assets/')))?(p.imageUrl.startsWith('/assets/')?'.'+p.imageUrl:p.imageUrl):''}));
  const supplierPriceRows=[
   {sku:'151-7737',source:'L&S Engineers',sourceUrl:'https://www.lsengineers.co.uk/air-filter-for-cat-c15-3412c-de400sgc-engines-replaces-oem-no-151-7737.html',basis:'New genuine OEM · GBP 57.20 ex VAT',amount:57.20,currency:'GBP',amootAmount:123.03,amootCurrency:'USD',fxToUsd:1.3036,fxDate:'2026-11-24',sourceAmountUsd:74.57,availability:'Back-order'},
   {sku:'136-3742',source:'KMP Brand',sourceUrl:'https://storeuk.kmpbrand.com/products/filter-136-3742-caterpillar.html',basis:'New aftermarket · GBP 0.84 ex VAT',amount:0.84,currency:'GBP',amootAmount:1.81,amootCurrency:'USD',fxToUsd:1.3036,fxDate:'2026-11-24',sourceAmountUsd:1.10,availability:'Low stock'},
   {sku:'CDQ2B32-25DZ',source:'SMC Pneumatics',sourceUrl:'https://www.smcpneumatics.com/CDQ2B32-25DZ.html',basis:'New · USD 45.00',amount:45,currency:'USD',amootAmount:74.25,amootCurrency:'USD',fxToUsd:1,fxDate:'2026-11-24',sourceAmountUsd:45,availability:'107 available to ship'},
   {sku:'SY5120-5LZ-01N',source:'Motion',sourceUrl:'https://www.motion.com/products/sku/09776092',basis:'New · USD 54.36',amount:54.36,currency:'USD',amootAmount:89.69,amootCurrency:'USD',fxToUsd:1,fxDate:'2026-11-24',sourceAmountUsd:54.36,availability:'Factory order / in stock'},
   {sku:'D1VW001CNJW',source:'RS Components',sourceUrl:'https://uk.rs-online.com/web/p/hydraulic-directional-control-valves/1346967',basis:'New · GBP 303.92 ex VAT',amount:303.92,currency:'GBP',amootAmount:653.72,amootCurrency:'USD',fxToUsd:1.3036,fxDate:'2026-11-24',sourceAmountUsd:396.19,availability:'In stock'}
  ];
  const supplierMapped=mapped.map(p=>{const r=supplierPriceRows.find(x=>x.sku.toUpperCase()===String(p.sku||'').toUpperCase());return r?{...p,priceReference:{source:r.source,sourceUrl:r.sourceUrl,basis:r.basis,amount:r.amount,currency:r.currency,amootAmount:r.amootAmount,amootCurrency:'USD',fxToUsd:r.fxToUsd,fxDate:r.fxDate,sourceAmountUsd:r.sourceAmountUsd,factor:1.65,availability:r.availability,observedAt:'2026-11-24'}}:p});

  const offRoadCatalogText = `
813967|(see details)
1003259|PUMP G
1004095|CARTRIDG
1005047|ALTERNATOR
1007408|CAMSHAFT A
1041752|PUMP GP
1052140|PUMP GP-PS&V
1052508|PUMP AS
1053196|MOTOR GRP
1053635|PUMP GP
1061792|STUD TAPER
1069872|PUMP GP
1075007|JOINT G-SL
1080850|SHAFT A.
1090077|SEAL O RIN
1115059|CORE AS AF
1116841|PUMP GP
1118010|REGULATOR
1118181|CYL GP-LIF
1125060|BRACKET AS
1150637|PUMP
1154517|CORE A
1159899|PUMP GP
1161980|PUMP GP-EN
1166562|CORE AS-O.
1167885|PAN OIL
1168046|BEARING AS
1197698|PUMP G-PS
1245142|CORE A
1253537|IDLER GP
1275537|CORE AS
1291908|CYL GP
1299452|GASKET EXH.
1330125|CORE AS
1331149|PUMP GP
1331403|PUMP GP-GE
1340467|(see details)
1342679|BOGIE AS
1342680|BOGIE AS-R
1362422|SEE 2394321
1362462|(see details)
1363965|PUMP GP
1375541|PUMP AS
1392383|PUMP GP
1409699|BAR GP-EQU
1414109|CORE A
1417916|CARTRIDGE
1425867|SEAL GP-CSHA
1425868|(see details)
1440725|ROD AS
1484644|DRIVE GP
1494915|COMPR GP-B
1507585|PUMP GP-GR
1515911|MANIFOLD A
1519385|MONITOR GP
1539624|PUMP GP-PS
1592950|SEAT GP-SU
1614110|PUMP GP-EO
1614111|PUMP GP-EO
1614113|PUMP GP-EO
1616634|PUMP GP-PS
1632478|SEAL-VALVE
1643692|SENSOR GP-
1658633|CYL GP-0121-
1661494|SEAL
1661495|SEAL-LIP TYP
1678130|DAMPER AS
1727766|PUMP GP-WT
1727767|PUMP
1738612|CYLINDER G
1774651|BAR GP
1779953|ALTERNATOR G
1795922|TURBO GP-BAS
1835296|HEAD GP-CY
1851016|RADIATOR G
1855294|ALTERNATOR G
1857593|DRIVE GP-FIN
1873523|CORE AS
1879090|PUMP GP-PS-B
1883865|TC GP-W/TDR
1888697|BEARING
1898777|(see details)
1908609|VALVE FILL
1930980|PUMP GP FR
1941252|SPRING GP-
1956617|PUMP GP-ME
1967795|BRG AS SPL
1978820|ALTERNATOR
1979322|LINER
1981508|PUMP GP-EO 2
1995525|LINK AS.-TRA
2024304|IDLER G TRAC
2044995|PUMP GP-GR
2045462|TURBO GP-B
2061556|HEAD GP-CY
2065214|SHAFT
2065889|A/C CONDEN
2071517|MOTOR G
2071556|MOTOR GP-ELE
2071560|MOTOR G
2114987|MOUNT-SUSP
2120403|CONT GP-XMSN
2125024|CONE
2128177|PUMP GP-WA
2135268|MOTOR G
2145097|STEERING CYL
2147568|SEAL-O RIN
2195847|HEAD GP-CY
2223676|BAR GP
2225152|KIT-REBUIL
2225153|KIT-REBUIL
2226926|BAR GP-EQU
2229219|SPINDLE
2231608|PUMP GP-BE
2237263|HEAD AS
2237468|CAMSHAFT A
2237962|CORE AS.
2239250|HEAD GP-CY
2244122|FRAME AS
2248809|RIM AS.
2267683|ALTERNATOR
2270844|CYL GP-010
2307132|PUMP GP-GR
2335220|PUMP GP-BE
2356501|PUMP GP-GR
2356823|CYL GP-011
2357133|ALTERNATOR
2357636|PIN AS
2357642|PIN AS
2371962|MOTOR GP-E
2373655|CONT GP
2385080|SEAL-O-RIN
2394322|SPRING G
2399988|TURBO GP-B
2418686|PUMP GP
2420673|CAMSHAFT A
2436650|CIRCLE AS
2443114|VALVE GP-M
2443304|PUMP GP-GR
2475212|MOTOR AS-G
2475232|MOTOR AS-G
2477133|REGULATOR-
2485513|REGULATOR-
2490059|COUPLING
2490313|ALTERNATOR
2500841|TURBO GP-B
2507700|TURBO GP-B
2512552|PIN AS
2512557|PIN
2512652|LINK AS-BR
2518266|ACCUMULATO
2525165|TURBO GP-B
2527086|MOUNTING AS-
2531752|PLATE-THRU
2543025|LINK AS-BR
2566453|SENSOR GP-
2602160|MONITOR GP
2602289|LINK AS-BR
2606642|SPINDLE
2606650|DRIVE GP-F
2606655|DRIVE GP-F
2612208|CONTROL GP
2635055|HEAD GP BA
2652299|DRIVE GP-F
2672755|PUMP GP-PS
2701763|PUMP GP-GE
2721889|ALTERNATOR
2726955|PUMP GP-2P
2730178|GEAR SIDE
2776918|ACTUATOR
2807374|PUMP GP-WA
2807856|MOTOR GP-P
2807864|MOTOR GP P
2818491|BAR GP-EQU
2818870|KIT-GASKET
2850852|TRUNNION
2892131|CONE SPL T
2929964|PUMP GP
2935712|CYL GP-065
2976876|KIT-GASKET
2979150|ADJUST GP
2979151|ADJUST GP
2979275|SPRING GP-
2979546|SEAL GP DU
2995204|PISTON AS
2995344|YOKE
2995840|CONT GP-XM
3050324|COMPRESSOR
3050325|COMPRESSOR
3050617|HEAD GP-CY
3058141|BLOCK GP-C
3073063|PUMP GP-PS
3073993|CONT GP-HA
3109354|CONTROL GP
3119541|PUMP GP-2P
3133997|CRANKSHAFT
3137770|PUMP GP-F XF
3144126|SEAL GP-DU
3144128|SEAL GP-DU
3144130|SEAL GP-DU
3145005|PISTON AS
3147755|REGULATOR
3161079|FRAME AS
3167251|ALTERNATOR
3172440|HEAD GP-CY
3178021|PUMP GP FU
3178766|BEARING -
3181181|SENSOR GP
3231170|IDLER GP-T
3238674|GEAR-WORM
3240532|PUMP GP-FU
3261644|FILTER AS
3320045|TURBO GP-B
3320046|TURBO GP-B
3327297|CAMSHAFT
3327298|CAMSHAFT
3331184|ALTERNATOR
3348389|CRANKSHAFT
3356220|HEAD GP-CY
3356352|SUSPENSION
3362213|PUMP GP-WA
3365750|DRIVE GP-F
3368670|HUB AS.
3383454|MOTOR GP-E
3383456|MOTOR GP-E
3410597|FRAME AS
3412182|CYL GP-SEA
3412814|CYL GP-SEA
3418543|SEAL GP
3434268|WHEEL AS
3442149|HEAD GP-CY
3477109|CAMSHAFT A
3496530|MOTOR GP E
3497059|CAP AS-FUE
3500666|PUMP GP-PI
3520200|PUMP GP-WA
3520202|PUMP GP-WA
3520203|PUMP GP-WATE
3520205|PUMP AS-WA
3520206|PUMP G
3520209|PUMP GP-WA
3520211|PUMP GP-WA
3522077|PUMP GP-WA
3530611|DRIVE GP-F
3545671|MOTOR GP-E
3577398|HEAD AS-CY
3579766|CYLINDER G
3579784|CYL GP-016
3579794|ROD AS
3584920|TURBO GP-B
3590936|HEAD GP-CY
3608960|ELEMENT FU
3628488|CYL GP-021
3634457|KIT-SEAL
3654920|SEAL GP DU
3654922|SEAL GP-DU
3741605|PUMP GP-GE
3751722|CYL GP-017
3752647|PUMP GP-FU
3789567|DRIVE GP-F
3793436|CORE AS-OC
3793504|CYL GP-090
3808698|TURBO GP-B
3816555|ROD AS
3826529|YOKE AS
3836807|GEAR SET
3849908|CRANKSHAFT
3850937|COMPRESSOR
3874367|CORE AS
3900788|MOTOR GP-E
3909923|SPINDLE
3920206|INJECTOR G
3968375|HEAD GP-CY
4152432|SENSOR GP-
4152433|SENSOR GP-
4160610|PUMP GP-WA
4170582|CYLINDER G
4210049|CAMSHAFT
4210071|CAMSHAFT
4211808|PUMP GP-PS
4232091|SEAL GP DU
4243629|PUMP GP-AU
4302593|CRANKSHAFT
4333677|HEAD AS-CO
4401616|COMPRESSOR
4410038|PIN AS
4414771|BAR GP-EQU
4452672|PUMP GP-GR
4481988|CYL GP-102
4505243|SHAFT
4506182|GEAR-WORM
4529831|CONT GP-XM
4583867|SHAFT-CIRC
4592220|CONT GP
4619930|GEAR-RING
4621014|CONT GP-XM
4621016|CONT GP-XM
4656884|PUMP AS
4685119|CRANKSHAFT
4793060|ACTUATOR A
4897195|RECOIL GP-
5133691|CYL GP-019
5582101|PINION
5613002|ALTERNATOR
5845631|DISPLAY GP
5912386|PUMP GP-DEF
6031668|PUMP GP-WA
6072611|CONTROL GP
6187079|HEAD GP-CY
6255917|SUSP GP-PE
0S1585|BOLT-PC
1G8878|FILTER
1H9696|RING
1J6472|RING
1J6740|BEARING
1N3574|CYL BLK G
1P0436|GASKET
1P3703|SEAL
1P3704|SEAL
1R0716|FILTER A
1R0739|FILTER AS
1R0749|FILTER
1R0750|FILTER
1R0751|FILTER AS
1R0762|FILTER A-F
1R1807|FILTER A
1R1808|FILTER A
1S4295|GASKET
1S6595|GASKET
1U5470|PRESSURE G
1U8846|GASKET MAKER
1W4879|CORE A
1W5009|CRANKSHAFT
1W6473|COMPRESSOR G
1W9771|CRANKSHAFT
20R0849|INJ GP FUE
20R4179|INJ GP FUE
20R8575|HEAD AS-CO
2A4429|LOCK
2J3506|NUT-PC
2J3507|NUT-PC
2M9780|SEAL O RING
2N2765|BOLT
2N2766|LOCK NUT
2S4078|SEAL
2S5926|VALVE
2W4088|CRANKSHAFT
2W6587|CORE A
2W6593|CORE A
2W9978|CORE AS.
3B8489|FITTING
3D2824|SEAL O RING
3E7577|ALTERNATOR G
3G4768|PUMP G
3G5868|PUMP G
3J1907|SEAL
3J7354|SEAL O RING
3K0360|SEAL
3K9770|NUT-PC
3P1465|SPRING
3P7958|PUMP GRPGE
3S9643|SEAL
3T1446|(see details)
3T7897|PUMP G
3T8098|PUMP G
3W6144|HUB
3W6551|SHAFT
3W7515|CYLINDER A
4J0520|SEAL O RING
4J0522|SEAL-O-RING
4J0524|SEAL-O-RING
4J5267|SEAL-O-RING
4J7533|SEAL O RING
4N1101|PUMP G
4N6765|HEAD A D343
4N7692|CRANKSHAFT A
4N7693|CRANKSHAFT A
4P2942|CAMSHAFT KIT
4P5638|PUMP GP
4P8730|TURBO GP
4P9075|INJECTOR
4W0255|SPIDER A
4W4980|CORE GRP
4W5056|CORE G
4W5405|CORE GRP
4W5477|PUMP G
4W9822|CORE G
5F3106|SEAL-O-RING
5G9660|GUARD A
5H6734|SEAL O RING
5J4773|BOLT
5K9090|SEAL O RING
5M2894|WASHER-PC
5N5692|ALTERNATOR G
5P0505|CONE BEARI
5P1076|WASHER
5P1948|CONE
5P1949|CUP
5P5678|M SEAL STK
5P8245|WASHER-PC
5P8247|WASHER-PC
5P8248|WASHER-PC
5P8250|WASHER-PC
6E3524|PUMP G
6E5024|CYLIND
6E6477|CARTRIDG
6G5533|(see details)
6I1346|PUMP G
6N0957|CORE A RAD
6N1030|PUMP G OIL
6N7960|CARTRIDGE
6N9294|ALTERNATOR G
6R4385|WHEEL A
6T6147|PUMP GP
6V0444|BEARING A
6V5839|WASHER
6V8397|SEAL
6V8398|SEAL O RING
6V9746|SEAL O RING
6W9744|SEAT G-BAS
6Y6712|PUMP G
6Y8764|PUMP
7C0145|CORE A
7C1772|PUMP GP
7C3039|CORE AS
7C3372|MOTOR G
7E7739|COMPRESSOR G
7G1958|SLEEVE WEA
7H3607|NUT
7K9205|SEAL
7M8485|SEAL
7N0110|CORE AS-OC
7N0165|CORE A OIL C
7N0718|SWITCH A
7N3486|MANIFOLD
7N4651|TURBO G
7N7748|TURBO G
7S7400|PUMP G
7T2731|PUMP G
7T2732|PUMP G
7T5417|BOGIE A
7T8001|SPINDLE
7V8702|CYLINDER G
7W0443|MOUNT A
7W0491|CORE A
7W1713|CORE GP
7W2203|HEAD GP
7W2243|HEAD A 3412
7W2326|FILTER A
7W5455|CORE A
7X7700|CAP AS-FUE
7Y1508|MUFFLER
8E2748|HUB
8E2837|SHAFT
8E2900|SHAFT PI
8E6709|PUMP G
8E6758|CONNECTO
8E7569|CASE
8H9789|BEARING
8J0498|PUMP G
8J6155|(see details)
8J6730|PUMP GRP
8M4432|SEAL O RING
8N1187|HEAD A 3306
8N1188|CYL HEAD GRP
8N6796|HEAD GRP S
8N7005|NOZZLE A
8R7036|SPIDER G
8S7717|MANIFOLD
8T3282|WASHER-PC
8T4121|WASHER-ZC
8T4122|WASHER-ZC
8T4123|WASHER-ZC
8T4133|NUT-ZC
8T4139|BOLT-ZC
8T4223|WASHER-ZC
8T4224|WASHER-ZC
8T4896|WASHER-ZC
8W1751|BRACKET A
8X0573|PIN
8Y6671|GUARD AS
9G7641|SWITCH G
9G8638|GEAR
9G9175|CARRIER
9G9180|HUB
9H0846|SEAL O RING
9M1974|WASHER-PC
9P6912|PIN
9P7390|DISC A
9P8517|CASE
9R7710|(see details)
9S8752|NUT-PC
9T5977|MOTOR G
9T7468|PUMP G
9T8346|PUMP GP
9U9558|BEARING
9V0206|CYLINDER G
9W1723|PUMP G
9W7095|CONE
9W9310|PUMP G
`;
  const offRoadCatalogRows=offRoadCatalogText.trim().split('\n').map(line=>{const [sku,...name]=line.split('|');return {sku:sku.trim(),description:name.join('|').trim()}}).filter(x=>x.sku&&x.description);
  const classifyOffRoadPart=(d)=>{
   const x=String(d).toUpperCase();
   if(/FILTER|ELEMENT FU|GASKET|SEAL|RING|WASHER|BOLT|NUT|STUD|FITTING|SPRING/.test(x))return ['فیلتر و مصرفی','قطعات مصرفی و اتصالات','./assets/product-filter.jpg'];
   if(/ALTERNATOR|SENSOR|SWITCH|MONITOR|DISPLAY|REGULATOR|MOTOR GP-ELE|A.C CONDEN/.test(x))return ['قطعات برقی','استارت، دینام و کنترل الکترونیکی','./assets/product-alternator.jpg'];
   if(/BOGIE|IDLER|WHEEL|RIM|SPINDLE|DRIVE GP|BAR GP|FRAME|SUSP|HUB|GUARD|CARRIER|RECOIL|TRACK/.test(x))return ['قطعات زیربندی','چرخ، رولیک، شاسی و انتقال قدرت','./assets/product-roller.jpg'];
   if(/VALVE|PUMP|MANIFOLD|CYL|ACTUATOR|ACCUMULATO|PRESSURE|CONTROL|STEERING|CARTRIDG/.test(x))return ['قطعات هیدرولیک','پمپ، شیر، سیلندر و کنترل','./assets/cat-hydraulic.jpg'];
   if(/TURBO|CAMSHAFT|CRANKSHAFT|HEAD|INJECTOR|INJ GP|LINER|PISTON|CYLINDER|COMPRESSOR|RADIATOR|MUFFLER|MOTOR|CORE|PAN OIL/.test(x))return ['قطعات موتور','موتور، توربو، سرسیلندر و سوخت‌رسانی','./assets/cat-engine.jpg'];
   if(/BEARING|CONE|GEAR|SHAFT|PINION|COUPLING|GEAR SET|PIN AS|PIN$/.test(x))return ['قطعات انتقال قدرت','بلبرینگ، دنده و اجزای انتقال نیرو','./assets/product-pump.jpg'];
   return ['قطعات عمومی','قطعات عمومی ماشین‌آلات کاترپیلار','./assets/cat-loader.jpg'];
  };

  const priceReferences=offRoadPriceRows.map((r,i)=>({id:9100000+i,kind:'PRODUCT',sourceUrl:'https://offroadeq.com/parts/'+r[0].replace(/-/g,''),sku:r[0],name:r[1]+' · '+r[0],brand:'Caterpillar',category:'قطعات کاترپیلار',technicalGroup:'قطعات موتور و ماشین‌آلات',machine_model:'نیازمند تطبیق سریال و آرایش',description:r[4]+'. تطبیق شماره سریال و پیکربندی دستگاه پیش از سفارش الزامی است.',applicationType:'UNVERIFIED',applicationEvidence:'کاربری/سازگاری در این رکورد قیمت تأیید نشده است.',price:0,price_irr:null,stock:0,image:'',priceReference:{source:'Off Road Equipment',basis:'OEM List Price',amount:r[2],currency:'USD',amootAmount:r[3],amootCurrency:'USD',factor:1.65,inventory:r[4],observedAt:'2026-11-24',sourceUrl:'https://offroadeq.com/parts/'+r[0].replace(/-/g,'')}}));
  const offRoadCatalogProducts=offRoadCatalogRows.map((r,i)=>{const [category,technicalGroup,image]=classifyOffRoadPart(r.description);const price=offRoadPriceRows.find(x=>x[0].replace(/[^A-Z0-9]/g,'')===r.sku.replace(/[^A-Z0-9]/g,''));const sku=r.sku;return {id:9200000+i,kind:'PRODUCT',sourceUrl:'https://www.offroadeq.com/parts/'+sku.replace(/-/g,''),sku,name:(r.description==='(see details)'?'قطعه کاترپیلار':r.description)+' · '+sku,brand:'Caterpillar',category,technicalGroup,machine_model:'نیازمند تطبیق سریال و آرایش',description:'این قطعه در فهرست عمومی قطعات محبوب Off Road Equipment درج شده است. وضعیت موجودی و شرایط دقیق کالا باید از تأمین‌کننده استعلام شود؛ تطبیق شماره سریال و پیکربندی دستگاه پیش از سفارش الزامی است.',applicationType:'UNVERIFIED',applicationEvidence:'کاربری دریایی/خشکی از فهرست عمومی قابل احراز نیست.',price:0,price_irr:null,stock:0,image,priceReference:price?{source:'Off Road Equipment',sourceUrl:'https://www.offroadeq.com/parts/'+sku.replace(/-/g,''),basis:'OEM List Price',amount:price[2],currency:'USD',amootAmount:price[3],amootCurrency:'USD',factor:1.65,inventory:price[4],observedAt:'2026-11-24'}:null}}); 
  const allOffRoad=[...priceReferences.map(r=>{const [category,technicalGroup,image]=classifyOffRoadPart(r.name);return {...r,category,technicalGroup,image}}),...offRoadCatalogProducts];
  const offRoadUnique=[...new Map(allOffRoad.map(r=>[String(r.sku).toUpperCase().replace(/[^A-Z0-9]/g,''),r])).values()];
  const combined=[...supplierMapped,...offRoadUnique.filter(r=>!supplierMapped.some(p=>String(p.sku).toUpperCase().replace(/[^A-Z0-9]/g,'')===r.sku.toUpperCase().replace(/[^A-Z0-9]/g,'')))];
  if(typeof window.setApiProducts==='function'){window.setApiProducts(combined);oldLoadProducts?.();}
  else oldLoadProducts?.();
 }catch(e){
  const cached=(()=>{try{return JSON.parse(localStorage.getItem('amoot_github_pages_v1')||'{}')}catch{return {}}})();
  if(cached.catalog_source==='server')oldLoadProducts?.();
  else{if(typeof window.setApiProducts==='function')window.setApiProducts([]);const meta=document.querySelector('#catalogMeta');if(meta)meta.textContent='دریافت محصولات از سرور ناموفق بود؛ لطفاً اتصال را بررسی کنید.';}
 }};
 if(base)window.loadProducts?.();
 async function renderMarineEngineDirectory(){
  const host=document.querySelector('#marineEngineGrid');if(!host)return;
  try{
   const data=await api('/api/marine-engines',{auth:false}),rows=data.items||[];
   const groups=[
    ['PROPULSION','موتورهای پیشران دریایی'],
    ['HIGH_PERFORMANCE','پیشران دریایی پرقدرت'],
    ['GENERATOR_SET','موتورهای ژنراتور دریایی'],
    ['AUXILIARY','موتورهای کمکی دریایی']
   ];
   host.innerHTML=groups.map(([key,label])=>{
    const models=rows.filter(x=>x.applicationGroup===key);
    return '<section class="marine-engine-group"><h3>'+label+' <small>· '+models.length+' مدل</small></h3><div class="marine-model-chips">'+models.map(x=>'<a class="marine-model-chip" href="'+escHtml(x.sourceUrl)+'" target="_blank" rel="noopener"><b>'+escHtml(x.modelName)+'</b><span>کاربری دریایی</span></a>').join('')+'</div></section>';
   }).join('');
  }catch(e){host.innerHTML='<div class="notice">فهرست موتورهای دریایی از سرور دریافت نشد: '+escHtml(e.message)+'</div>'}
 }
 renderMarineEngineDirectory();

 window.customerOrders=async u=>{
  const el=document.querySelector('#customerContent');if(!el)return;el.innerHTML='<h3>سفارش‌های من</h3><div class="empty-state">در حال دریافت سفارش‌ها از سرور...</div>';
  try{const data=await api('/api/orders');el.innerHTML='<h3>سفارش‌های من ('+data.items.length+')</h3>'+(data.items.length?'<div class="customer-list">'+data.items.map(o=>'<article><b>'+escHtml(o.orderNumber)+' · '+Number(o.totalIrr).toLocaleString('fa-IR')+' ریال</b><small>'+new Date(o.createdAt).toLocaleString('fa-IR')+' · '+escHtml(o.status)+'</small><small>'+o.items.map(i=>escHtml(i.nameSnapshot)+' × '+Number(i.quantity)).join('، ')+'</small></article>').join('')+'</div>':'<div class="empty-state">هنوز سفارشی ثبت نکرده‌اید.</div>')}
  catch(e){el.innerHTML='<div class="empty-state">'+e.message+'</div>'}
 };
})();
