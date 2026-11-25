(()=> {
 const apiBase=String(window.AMOOT_API_BASE_URL||"").replace(/\/$/,"");
 const anon=String(window.AMOOT_SUPABASE_ANON_KEY||"");
 const KEY="amoot_analytics_session_v1";
 const uuid=()=>crypto.randomUUID?crypto.randomUUID():"xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,c=>{const r=Math.random()*16|0;return(c==="x"?r:(r&3|8)).toString(16)});
 let session=localStorage.getItem(KEY);
 if(!session||!/^[0-9a-f-]{36}$/i.test(session)){session=uuid();localStorage.setItem(KEY,session)}
 window.amootTrack=(eventType,data={})=>{
  if(!apiBase||!anon)return;
  const body={eventType,sessionId:session,pagePath:location.pathname,...data};
  fetch(apiBase+"/api/analytics/events",{method:"POST",headers:{apikey:anon,"Content-Type":"application/json"},body:JSON.stringify(body),keepalive:true}).catch(()=>{});
 };
 window.amootTrack("page_view");
})();