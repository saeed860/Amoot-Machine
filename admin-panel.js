/* AMOOT full-screen administration workspace */
(()=>{
 const TOKEN='amoot_api_token_v1', USER='amoot_api_user_v1';
 const originalShowModal=window.showModal;
 const esc=s=>String(s??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 const nav=[
  ['dashboard','▦','نمای کلی و تحلیل'],
  ['orders','▤','مدیریت سفارش‌ها'],
  ['products','⚙','محصولات و کاتالوگ'],
  ['customers','♙','مدیریت کاربران'],
  ['quotes','▧','استعلام‌ها و درخواست‌ها'],
  ['inventory','▥','دفتر گردش موجودی'],
  ['receipts','＋','رسید ورود انبار'],
  ['lowstock','⚠','هشدار کمبود موجودی']
 ];
 let active='dashboard';
 function user(){try{return JSON.parse(localStorage.getItem(USER)||'{}')}catch{return {}}}
 function shell(){
  document.getElementById('amootAdminWorkspace')?.remove();
  const u=user(),isAdmin=u.role==='ADMIN';
  const root=document.createElement('section');root.id='amootAdminWorkspace';root.dir='rtl';
  root.innerHTML='<aside class="am-admin-sidebar"><div class="am-admin-brand"><img src="./assets/amoot-logo.png" alt=""><div><b>آموت ماشین</b><small>مدیریت یکپارچه</small></div></div><div class="am-admin-profile"><span class="am-admin-avatar">AM</span><div><b>'+esc(u.displayName||u.identifier||'مدیر سیستم')+'</b><small>'+(isAdmin?'مدیر کل':'اپراتور')+'</small></div></div><nav class="am-admin-nav">'+nav.filter(n=>isAdmin||!['customers','inventory','receipts','lowstock'].includes(n[0])).map(n=>'<button type="button" data-admin-tab="'+n[0]+'"><i>'+n[1]+'</i><span>'+n[2]+'</span><b>‹</b></button>').join('')+'</nav><div class="am-admin-sidefoot"><span class="am-live-dot"></span> اتصال امن به سرور</div></aside><main class="am-admin-main"><header class="am-admin-top"><div><button class="am-admin-menu" id="amAdminMenu">☰</button><div><small>AMOOT MACHINE / CONTROL CENTER</small><h1 id="amAdminTitle">نمای کلی و تحلیل</h1></div></div><div class="am-admin-top-actions"><span class="am-admin-role">'+(isAdmin?'ADMIN':'OPERATOR')+'</span><button type="button" id="amAdminRefresh">↻ بروزرسانی</button><a href="./index.html" target="_blank" rel="noopener">مشاهده فروشگاه ↗</a><button type="button" class="am-admin-logout" id="amAdminLogout">خروج</button></div></header><section class="am-admin-content" id="amootAdminContent"><div class="am-admin-loading">در حال بارگذاری پنل مدیریت…</div></section></main>';
  document.body.appendChild(root);document.body.classList.add('am-admin-open');
  root.querySelectorAll('[data-admin-tab]').forEach(b=>b.addEventListener('click',()=>navigate(b.dataset.adminTab)));
  root.querySelector('#amAdminRefresh').onclick=()=>navigate(active);
  root.querySelector('#amAdminMenu').onclick=()=>root.classList.toggle('am-sidebar-open');
  root.querySelector('#amAdminLogout').onclick=()=>{localStorage.removeItem(TOKEN);localStorage.removeItem(USER);root.remove();document.body.classList.remove('am-admin-open');window.openAdmin()};
  window.showModal=(html)=>{const host=document.getElementById('amootAdminContent');if(host){host.innerHTML=html;host.scrollTop=0}else originalShowModal(html)};
  navigate('dashboard');
 }
 const titles={dashboard:'نمای کلی و تحلیل',orders:'مدیریت سفارش‌ها',products:'محصولات و کاتالوگ',customers:'مدیریت کاربران',quotes:'استعلام‌ها و درخواست‌ها',inventory:'دفتر گردش موجودی',receipts:'رسید ورود انبار',lowstock:'هشدار کمبود موجودی'};
 async function navigate(tab){
  active=tab;const root=document.getElementById('amootAdminWorkspace');if(!root)return;
  root.querySelector('#amAdminTitle').textContent=titles[tab]||'مدیریت';
  root.querySelectorAll('[data-admin-tab]').forEach(b=>b.classList.toggle('active',b.dataset.adminTab===tab));
  root.classList.remove('am-sidebar-open');
  const host=root.querySelector('#amootAdminContent');host.innerHTML='<div class="am-admin-loading"><span></span> در حال دریافت اطلاعات از سرور…</div>';
  try{
   if(tab==='dashboard'){host.innerHTML='<div id="adminContent"></div>';if(typeof window.analyticsTab==='function')await window.analyticsTab('30d');else await window.renderAdminOrders()}
   if(tab==='orders')await window.renderAdminOrders();
   if(tab==='products')await window.renderAdminProducts();
   if(tab==='customers')await window.renderAdminCustomers();
   if(tab==='quotes')await window.renderAdminQuotes();
   if(tab==='inventory')await window.renderAdminInventoryMovements();
   if(tab==='receipts')await window.renderAdminReceipts();
   if(tab==='lowstock')await window.renderAdminLowStock();
  }catch(e){host.innerHTML='<div class="am-admin-error"><b>بارگذاری این بخش ناموفق بود</b><p>'+esc(e.message)+'</p><button onclick="window.amootAdminNavigate(\''+tab+'\')">تلاش مجدد</button></div>'}
 }
 window.amootAdminNavigate=navigate;
 window.openAdmin=()=>{
  const token=localStorage.getItem(TOKEN);
  if(token&&['ADMIN','OPERATOR'].includes(user().role)){shell();return}
  originalShowModal('<div class="auth-box"><div class="auth-brand"><b>AMOOT MACHINE</b><small>ورود امن به مرکز مدیریت</small></div><div class="notice">دسترسی مدیریت فقط برای حساب‌های دارای نقش ADMIN یا OPERATOR فعال است.</div><form id="amootFullAdminLogin"><div class="field"><label>ایمیل یا شناسه مدیر</label><input name="identifier" autocomplete="username" required></div><div class="field"><label>رمز عبور</label><input name="password" type="password" autocomplete="current-password" required></div><button class="btn yellow" type="submit">ورود به مرکز مدیریت</button><p id="amAdminLoginError" class="auth-foot"></p></form></div>');
  document.querySelector('#amootFullAdminLogin').onsubmit=async e=>{e.preventDefault();const form=e.currentTarget,btn=form.querySelector('button'),msg=form.querySelector('#amAdminLoginError'),d=Object.fromEntries(new FormData(form));btn.disabled=true;msg.textContent='در حال احراز هویت…';try{const r=await window.amootApi('/api/auth/login',{method:'POST',auth:false,body:d});if(!['ADMIN','OPERATOR'].includes(r.user.role))throw Error('این حساب مجوز مدیریت ندارد.');localStorage.setItem(TOKEN,r.token);localStorage.setItem(USER,JSON.stringify(r.user));document.getElementById('modal')?.classList.remove('open');shell()}catch(err){msg.textContent=err.message;btn.disabled=false}}
 };
 window.closeAdminWorkspace=()=>{document.getElementById('amootAdminWorkspace')?.remove();document.body.classList.remove('am-admin-open');window.showModal=originalShowModal};
 window.addEventListener('keydown',e=>{if(e.key==='Escape'&&document.getElementById('amootAdminWorkspace'))window.closeAdminWorkspace()});
})();