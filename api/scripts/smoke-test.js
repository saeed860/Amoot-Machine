const base = process.env.API_BASE_URL || 'http://127.0.0.1:4000';
const stamp = Date.now();
const check = (condition, message) => { if (!condition) throw new Error(message); console.log('PASS', message); };
async function request(path, { method='GET', token, body, headers={} }={}) {
  const response = await fetch(base + path, { method, headers: { ...(body ? {'content-type':'application/json'} : {}), ...(token ? {authorization:`Bearer ${token}`} : {}), ...headers }, body: body ? JSON.stringify(body) : undefined });
  const data = await response.json().catch(() => ({}));
  if (!response.ok) throw new Error(`${method} ${path} -> ${response.status}: ${JSON.stringify(data)}`);
  return data;
}
try {
  const health = await request('/api/health');
  check(health.ok && health.database === 'connected', 'API health and PostgreSQL connection');
  const products = await request('/api/products');
  check(Array.isArray(products.items) && products.items.length > 0, 'Seeded product catalog');
  const identifier = `ci-${stamp}@example.test`;
  const password = 'CI-Only-Password-2026!';
  const registered = await request('/api/auth/register', { method:'POST', body:{identifier,displayName:'CI Customer',password} });
  check(Boolean(registered.token), 'Customer registration');
  const me = await request('/api/me', { token:registered.token });
  check(me.identifier === identifier, 'Authenticated customer profile');
  const sku = '1R-0716';
  const stockBefore = Number(products.items.find(x => x.sku === sku)?.stock);
  check(Number.isInteger(stockBefore) && stockBefore > 0, 'Initial inventory available for lifecycle test');
  const orderBody = { items:[{sku,quantity:1}], shipping:{recipient:'CI Customer',phone:'09120000000',province:'تهران',city:'تهران',postalCode:'1111111111',addressLine:'خیابان آزمایشی، پلاک ۱'} };
  const idem = `ci-order-${stamp}`;
  const created = await request('/api/orders', {method:'POST',token:registered.token,headers:{'Idempotency-Key':idem},body:orderBody});
  check(Boolean(created.order?.orderNumber), 'Order creation and stock transaction');
  const replay = await request('/api/orders', {method:'POST',token:registered.token,headers:{'Idempotency-Key':idem},body:orderBody});
  check(replay.order?.orderNumber === created.order.orderNumber, 'Idempotent order retry');
  const ownOrders = await request('/api/orders', {token:registered.token});
  check(ownOrders.items.some(x => x.orderNumber === created.order.orderNumber), 'Customer order history');
  const quote = await request('/api/quotes', {method:'POST',body:{name:'CI Customer',phone:'09120000000',productSku:'HPU-042',message:'درخواست استعلام آزمایشی برای تست CI'}});
  check(Boolean(quote.quote?.quoteNumber), 'Quote request submission');
  const admin = await request('/api/auth/login', {method:'POST',body:{identifier:process.env.ADMIN_IDENTIFIER,password:process.env.ADMIN_PASSWORD}});
  const adminOrders = await request('/api/admin/orders',{token:admin.token});
  check(adminOrders.items.some(x=>x.orderNumber===created.order.orderNumber),'Admin order visibility');
  const updated = await request(`/api/admin/orders/${created.order.orderNumber}/status`,{method:'PATCH',token:admin.token,body:{status:'CONFIRMED'}});
  check(updated.order.status==='CONFIRMED','Admin order status update');
  const cancelled = await request(`/api/admin/orders/${created.order.orderNumber}/status`,{method:'PATCH',token:admin.token,body:{status:'CANCELLED'}});
  check(cancelled.order.status==='CANCELLED','Order cancellation transition');
  const stockAfterCancel = await request('/api/products');
  check(Number(stockAfterCancel.items.find(x => x.sku === sku)?.stock) === stockBefore,'Cancellation restores inventory exactly once');
  const cancelledAgain = await request(`/api/admin/orders/${created.order.orderNumber}/status`,{method:'PATCH',token:admin.token,body:{status:'CANCELLED'}});
  check(cancelledAgain.order.status==='CANCELLED','Repeated cancellation is idempotent');
  const stockAfterRetry = await request('/api/products');
  check(Number(stockAfterRetry.items.find(x => x.sku === sku)?.stock) === stockBefore,'Repeated cancellation does not double-restock');
  const invalidTransition = await fetch(base+`/api/admin/orders/${created.order.orderNumber}/status`,{method:'PATCH',headers:{'content-type':'application/json',authorization:`Bearer ${admin.token}`},body:JSON.stringify({status:'CONFIRMED'})});
  const invalidBody = await invalidTransition.json().catch(()=>({}));
  check(invalidTransition.status===409 && invalidBody.error?.code==='INVALID_ORDER_TRANSITION','Cancelled order cannot be reopened');
  const deliveryOrder = await request('/api/orders',{method:'POST',token:registered.token,headers:{'Idempotency-Key':`ci-delivery-${stamp}`},body:orderBody});
  check(Boolean(deliveryOrder.order?.orderNumber),'Second order created for delivery lifecycle');
  for (const status of ['CONFIRMED','PROCESSING','SHIPPED','DELIVERED']) {
    const result = await request(`/api/admin/orders/${deliveryOrder.order.orderNumber}/status`,{method:'PATCH',token:admin.token,body:{status}});
    check(result.order.status===status,`Order lifecycle transition to ${status}`);
  }
  const deliveredCannotCancel = await fetch(base+`/api/admin/orders/${deliveryOrder.order.orderNumber}/status`,{method:'PATCH',headers:{'content-type':'application/json',authorization:`Bearer ${admin.token}`},body:JSON.stringify({status:'CANCELLED'})});
  check(deliveredCannotCancel.status===409,'Delivered order cannot be cancelled');
  console.log('ALL API SMOKE TESTS PASSED');
} catch (error) { console.error('API SMOKE TEST FAILED:', error); process.exitCode=1; }
