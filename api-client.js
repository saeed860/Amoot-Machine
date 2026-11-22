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
  async function renderAdminOrders(){try{const data=await api('/api/admin/orders');window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · SECURE ADMIN</div><h3>مدیریت سفارش‌ها ('+data.items.length+')</h3></div><button class="mini red" onclick="logoutAccount()">خروج</button></div><div style="display:flex;gap:8px;flex-wrap:wrap;margin:12px 0"><button class="btn yellow" onclick="window.renderAdminProducts()">مدیریت کالاها / Excel</button><button class="btn dark" onclick="window.renderAdminCustomers()">مدیریت کاربران</button><button class="btn dark" onclick="window.renderAdminQuotes()">مدیریت استعلام‌ها</button></div><div class="table-wrap"><table><thead><tr><th>شماره سفارش</th><th>مشتری</th><th>مبلغ (ریال)</th><th>وضعیت</th><th>شرکت حمل</th><th>شماره رهگیری</th><th>عملیات</th></tr></thead><tbody>'+data.items.map(o=>'<tr><td dir="ltr">'+escHtml(o.orderNumber)+'</td><td>'+escHtml(o.user.displayName||'')+'<br>'+escHtml(o.user.identifier||'')+'</td><td>'+Number(o.totalIrr).toLocaleString('fa-IR')+'</td><td>'+escHtml(o.status)+'</td><td><input aria-label="شرکت حمل" placeholder="شرکت حمل" maxlength="100" data-carrier="'+escHtml(o.orderNumber)+'" value="'+escHtml(o.shippingCarrier||'')+'" style="width:110px"></td><td><input aria-label="شماره رهگیری" placeholder="شماره رهگیری" maxlength="100" data-tracking="'+escHtml(o.orderNumber)+'" value="'+escHtml(o.trackingNumber||'')+'" style="width:130px"></td><td><select data-status="'+escHtml(o.orderNumber)+'">'+orderStatusOptions(o.status)+'</select><button class="mini" data-save-status="'+o.orderNumber+'">ثبت وضعیت</button><button class="mini" data-save-shipping="'+escHtml(o.orderNumber)+'">ثبت رهگیری</button></td></tr>').join('')+'</tbody></table></div>');if(JSON.parse(localStorage.getItem(USER_KEY)||'{}').role!=='ADMIN'){document.querySelectorAll('button[onclick="window.renderAdminProducts()"],button[onclick="window.renderAdminCustomers()"]').forEach(b=>b.remove())}document.querySelectorAll('[data-status]').forEach(x=>x.value=data.items.find(o=>o.orderNumber===x.dataset.status)?.status||'PENDING');document.querySelectorAll('[data-save-status]').forEach(b=>b.onclick=async()=>{try{const id=b.dataset.saveStatus,status=document.querySelector('[data-status="'+id+'"]').value;await api('/api/admin/orders/'+encodeURIComponent(id)+'/status',{method:'PATCH',body:{status}});window.toast('وضعیت سفارش به‌روزرسانی شد.');await renderAdminOrders()}catch(e){window.toast(e.message)}});document.querySelectorAll('[data-save-shipping]').forEach(b=>b.onclick=async()=>{try{const id=b.dataset.saveShipping,carrier=document.querySelector('[data-carrier="'+id+'"]').value.trim(),trackingNumber=document.querySelector('[data-tracking="'+id+'"]').value.trim();await api('/api/admin/orders/'+encodeURIComponent(id)+'/shipping',{method:'PATCH',body:{carrier,trackingNumber}});window.toast('اطلاعات رهگیری ذخیره شد.');await renderAdminOrders()}catch(e){window.toast(e.message)}})}catch(e){window.toast(e.message)}}

 window.renderAdminOrders=renderAdminOrders;

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
   window.showModal('<div class="admin-head"><div><div class="eyebrow">AMOOT MACHINE · CATALOG</div><h3>مدیریت کالاها ('+data.items.length+')</h3></div><button class="mini" onclick="window.renderAdminOrders()">بازگشت به سفارش‌ها</button></div><div class="notice">فایل Excel با ستون‌های SKU، Name، Category، PriceIrr، Stock، Brand، MachineModel، Description، ImageUrl و Status قابل ورود است. کالاهای دارای SKU تکراری به‌روزرسانی می‌شوند.</div><div class="field"><label>انتخاب فایل Excel یا CSV</label><input id="amootProductFile" type="file" accept=".xlsx,.xls,.csv"></div><button class="btn yellow" id="amootImportProducts">ورود گروهی کالاها</button><button class="btn dark" type="button" onclick="window.renderAdminLowStock()">گزارش کمبود موجودی</button><p id="amootImportMessage" class="auth-foot">حداکثر ۵۰۰ ردیف در هر بار.</p><div class="table-wrap" style="margin-top:16px"><table><thead><tr><th>کد کالا</th><th>نام</th><th>دسته</th><th>قیمت (ریال)</th><th>موجودی</th><th>وضعیت</th></tr></thead><tbody>'+data.items.map(p=>'<tr><td dir="ltr">'+escHtml(p.sku)+'</td><td>'+escHtml(p.name)+'</td><td>'+escHtml(p.category)+'</td><td>'+ (p.priceIrr?Number(p.priceIrr).toLocaleString('fa-IR'):'استعلام')+'</td><td>'+Number(p.stock).toLocaleString('fa-IR')+'</td><td><select data-product-status="'+escHtml(p.sku)+'"><option value="ACTIVE">فعال</option><option value="INACTIVE">غیرفعال</option><option value="ARCHIVED">بایگانی</option></select><button class="mini" data-product-edit="'+escHtml(p.sku)+'" type="button">ویرایش</button></td></tr>').join('')+'</tbody></table></div>');
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
  const mapped=rows.map(p=>({id:(()=>{let h=2166136261;for(const ch of String(p.sku||p.id)){h=Math.imul(h^ch.charCodeAt(0),16777619)}return h>>>0})(),serverId:p.id,sku:p.sku,name:p.name,brand:p.brand||'',category:p.category,machine_model:p.machineModel||'',description:p.description||'',price:p.priceIrr===null?0:Number(p.priceIrr)/10,price_irr:p.priceIrr,stock:p.stock,image:(typeof p.imageUrl==='string'&&(p.imageUrl.startsWith('https://')||p.imageUrl.startsWith('http://')||p.imageUrl.startsWith('data:image/')||p.imageUrl.startsWith('./assets/')||p.imageUrl.startsWith('/assets/')))?(p.imageUrl.startsWith('/assets/')?'.'+p.imageUrl:p.imageUrl):''}));
  if(typeof window.setApiProducts==='function'){window.setApiProducts(mapped);oldLoadProducts?.();}
  else oldLoadProducts?.();
 }catch(e){
  const cached=(()=>{try{return JSON.parse(localStorage.getItem('amoot_github_pages_v1')||'{}')}catch{return {}}})();
  if(cached.catalog_source==='server')oldLoadProducts?.();
  else{if(typeof window.setApiProducts==='function')window.setApiProducts([]);const meta=document.querySelector('#catalogMeta');if(meta)meta.textContent='دریافت محصولات از سرور ناموفق بود؛ لطفاً اتصال را بررسی کنید.';}
 }};
 if(base)window.loadProducts?.();
 window.customerOrders=async u=>{
  const el=document.querySelector('#customerContent');if(!el)return;el.innerHTML='<h3>سفارش‌های من</h3><div class="empty-state">در حال دریافت سفارش‌ها از سرور...</div>';
  try{const data=await api('/api/orders');el.innerHTML='<h3>سفارش‌های من ('+data.items.length+')</h3>'+(data.items.length?'<div class="customer-list">'+data.items.map(o=>'<article><b>'+escHtml(o.orderNumber)+' · '+Number(o.totalIrr).toLocaleString('fa-IR')+' ریال</b><small>'+new Date(o.createdAt).toLocaleString('fa-IR')+' · '+escHtml(o.status)+'</small><small>'+o.items.map(i=>escHtml(i.nameSnapshot)+' × '+Number(i.quantity)).join('، ')+'</small></article>').join('')+'</div>':'<div class="empty-state">هنوز سفارشی ثبت نکرده‌اید.</div>')}
  catch(e){el.innerHTML='<div class="empty-state">'+e.message+'</div>'}
 };
})();
