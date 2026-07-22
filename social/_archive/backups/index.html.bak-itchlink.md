<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FREE Cinematic Arrival Scene · for Curse of Strahd DMs · EndoCraft</title>
<meta name="description" content="A free, table-ready cinematic arrival scene for your Curse of Strahd game — the carriage, the village, the castle, the lord. Straight to your inbox.">
<link rel="canonical" href="https://endocraft.app/free/">
<meta property="og:title" content="FREE Cinematic Arrival Scene · for Curse of Strahd DMs · EndoCraft">
<meta property="og:description" content="Play your players the valley. A free table-ready arrival scene for Curse of Strahd — straight to your inbox.">
<meta property="og:image" content="https://endocraft.app/free/og-image.jpg">
<meta property="og:type" content="website">
<meta property="og:site_name" content="EndoCraft">
<meta property="og:url" content="https://endocraft.app/free/">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="FREE Cinematic Arrival Scene · for Curse of Strahd DMs · EndoCraft">
<meta name="twitter:description" content="Play your players the valley. A free table-ready arrival scene for Curse of Strahd.">
<meta name="twitter:image" content="https://endocraft.app/free/og-image.jpg">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@500;700;900&family=Cinzel+Decorative:wght@700;900&family=EB+Garamond:ital@0;1&family=DM+Sans:wght@400;500;700&family=Cormorant+Garamond:ital,wght@1,500;0,700&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#0a0c14;--bg2:#10131c;--panel:#181c28;--panel2:#1f2433;--line:#2c3247;
  --gold:#d8b46a;--gold-bright:#e6c878;--gold-dim:#9c8244;--ink:#f3edd9;--muted:#9aa0b3;--red:#d98a8a;--green:#7bbd8f;
}
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{background:var(--bg);color:var(--ink);font-family:'DM Sans',system-ui,sans-serif;font-size:16px;line-height:1.6;-webkit-font-smoothing:antialiased;overflow-x:hidden}
img,video{display:block;max-width:100%}
a{color:var(--gold);text-decoration:none}
a:hover{color:var(--gold-bright)}
.nav{position:absolute;top:0;left:0;right:0;z-index:10;padding:18px 28px;display:flex;justify-content:space-between;align-items:center}
.brand{font-family:'Cinzel Decorative',serif;font-weight:700;font-size:17px;color:var(--gold);letter-spacing:2px;display:flex;align-items:center;gap:9px}
.brand-seal{width:28px;height:28px;border-radius:50%;box-shadow:0 0 10px rgba(216,180,106,.4)}

/* ===== HERO (clip-led) ===== */
.hero{position:relative;padding:96px 22px 56px;background:radial-gradient(ellipse 80% 70% at 50% 30%,#1a1f2e 0%,#08090e 82%);text-align:center}
.hero-inner{position:relative;max-width:880px;margin:0 auto;z-index:2}
.eyebrow{font-family:'Cinzel',serif;font-size:11.5px;color:var(--gold);letter-spacing:4px;text-transform:uppercase;margin-bottom:16px;display:inline-flex;align-items:center;gap:12px}
.eyebrow::before,.eyebrow::after{content:'';width:26px;height:1px;background:var(--gold-dim)}
.hero h1{font-family:'Cinzel Decorative',serif;font-size:clamp(34px,6vw,60px);font-weight:900;line-height:1.05;color:var(--gold-bright);margin-bottom:14px;letter-spacing:.5px}
.hero-tag{font-family:'Cormorant Garamond',serif;font-style:italic;font-size:clamp(18px,2.2vw,23px);color:#c8cede;margin:0 auto 30px;max-width:620px}
.hero-tag b{color:var(--ink);font-style:normal}
/* the film */
.film{position:relative;max-width:820px;margin:0 auto 30px;border-radius:16px;overflow:hidden;border:1px solid var(--gold-dim);background:#000;box-shadow:0 34px 80px -24px rgba(0,0,0,.92),0 0 60px -14px rgba(216,180,106,.26)}
.film::after{content:'';position:absolute;inset:0;border-radius:16px;border:1px solid rgba(255,255,255,.05);pointer-events:none}
.film video{width:100%;aspect-ratio:16/9;object-fit:cover;display:block;background:#000}
.film-badge{position:absolute;top:12px;left:12px;z-index:3;font-family:'Cinzel',serif;font-size:10px;letter-spacing:2px;text-transform:uppercase;color:var(--gold-bright);background:rgba(8,9,14,.7);border:1px solid var(--gold-dim);padding:5px 12px;border-radius:20px;backdrop-filter:blur(4px)}
.sound-btn{position:absolute;bottom:12px;right:12px;z-index:3;background:rgba(8,9,14,.72);border:1px solid var(--gold-dim);color:var(--gold-bright);font-family:'Cinzel',serif;font-size:11px;letter-spacing:1px;text-transform:uppercase;padding:7px 13px;border-radius:8px;cursor:pointer;backdrop-filter:blur(4px)}
.sound-btn:hover{background:rgba(24,28,40,.9)}
/* form */
.form{max-width:520px;margin:0 auto;display:flex;flex-direction:column;gap:11px}
.form-row{display:flex;gap:10px;flex-wrap:wrap}
.form input[type="email"]{flex:1;min-width:220px;background:rgba(24,28,40,.92);border:1px solid var(--line);border-radius:10px;color:var(--ink);padding:16px 18px;font-size:16px;font-family:inherit;transition:.2s}
.form input:focus{outline:none;border-color:var(--gold);background:var(--panel2)}
.form input::placeholder{color:var(--muted)}
.btn-primary{background:linear-gradient(180deg,#e6c878,#c7a253);color:#1a1408;border:none;border-radius:10px;padding:16px 28px;font-size:15px;font-family:'Cinzel',serif;font-weight:700;letter-spacing:1.5px;text-transform:uppercase;cursor:pointer;transition:.15s;white-space:nowrap}
.btn-primary:hover{background:linear-gradient(180deg,#f0d088,#d8b46a);transform:translateY(-1px)}
.btn-primary:disabled{opacity:.5;cursor:not-allowed;transform:none}
.micro{margin:12px auto 0;font-size:14px;line-height:1.45;color:rgba(243,237,225,.72);max-width:460px}
.micro b{color:var(--gold-bright)}
.badges{display:flex;gap:10px;flex-wrap:wrap;justify-content:center;margin-top:16px}
.badge{display:inline-flex;align-items:center;gap:8px;font-family:'Cinzel',serif;font-size:11px;letter-spacing:1.5px;text-transform:uppercase;color:var(--gold-bright);border:1px solid var(--gold-dim);padding:7px 15px;border-radius:30px;background:rgba(216,180,106,.06);text-decoration:none;transition:border-color .15s,color .15s,background .15s}
.badge .dot{width:7px;height:7px;border-radius:50%;background:var(--gold);box-shadow:0 0 8px var(--gold)}
.badge.gw{color:#c8cede;border-color:var(--line)}
.badge.gw b{color:var(--gold-bright)}
a.badge.gw:hover{border-color:var(--gold-dim);color:var(--ink);background:rgba(216,180,106,.1)}
.error-msg{background:rgba(217,138,138,.12);border:1px solid var(--red);color:var(--red);padding:11px 16px;border-radius:8px;font-size:13px;text-align:center}

/* ===== secondary: more of our work ===== */
.v2sec{padding:70px 20px;border-top:1px solid var(--line);background:var(--bg2)}
.v2inner{max-width:1020px;margin:0 auto;text-align:center}
.v2kicker{color:var(--gold);letter-spacing:.28em;text-transform:uppercase;font-size:12px;font-weight:700;margin-bottom:10px;font-family:'Cinzel',serif}
.v2h{font-size:clamp(24px,3.6vw,34px);line-height:1.15;margin-bottom:12px;font-family:'Cinzel Decorative',serif;color:var(--gold-bright)}
.v2sub{color:var(--muted);max-width:640px;margin:0 auto 28px}
.v2code{display:inline-block;border:1px solid var(--gold-dim);border-radius:8px;padding:2px 12px;color:var(--gold-bright);margin-top:8px}
.v2grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(210px,1fr));gap:16px;margin-bottom:26px}
.v2tile{background:var(--panel);border:1px solid var(--line);border-radius:14px;overflow:hidden;transition:transform .2s,border-color .2s;display:block}
.v2tile:hover{transform:translateY(-4px);border-color:var(--gold-dim)}
.v2tile video{width:100%;aspect-ratio:3/4;object-fit:cover}
.v2tile .t{padding:12px 14px;font-size:14.5px;color:var(--ink);text-align:left;line-height:1.35}
.v2tile .t small{color:var(--muted);display:block;margin-top:2px}
.v2btn{display:inline-block;background:transparent;border:1px solid var(--gold-dim);color:var(--gold);font-weight:700;padding:12px 22px;border-radius:10px}
.v2btn:hover{background:var(--panel2);color:var(--gold-bright)}

/* footer */
.foot{padding:34px 20px 40px;text-align:center;border-top:1px solid var(--line);background:var(--bg)}
.foot .seal{width:40px;height:40px;border-radius:50%;margin:0 auto 12px;opacity:.9}
.foot p{font-family:'EB Garamond',serif;font-size:13px;color:var(--muted);line-height:1.6}
.foot a{font-size:12px}

/* thank you */
.thank-you{position:fixed;inset:0;background:radial-gradient(ellipse 82% 56% at 50% 6%,rgba(216,180,106,.13) 0%,transparent 55%),rgba(8,9,14,.975);display:none;align-items:center;justify-content:center;z-index:100;padding:24px;overflow-y:auto}
.thank-you.show{display:flex}
.ty-inner{max-width:540px;text-align:center;background:linear-gradient(180deg,#1c2130 0%,var(--panel) 60%);border:1px solid rgba(216,180,106,.5);border-radius:18px;padding:46px 36px;animation:rise .4s ease-out;box-shadow:0 24px 70px -20px rgba(0,0,0,.85),0 0 90px -30px rgba(216,180,106,.3)}
@keyframes rise{from{opacity:0;transform:translateY(20px)}to{opacity:1;transform:translateY(0)}}
.ty-inner h2{font-family:'Cinzel Decorative',serif;font-size:27px;color:var(--gold-bright);margin-bottom:12px;font-weight:900;letter-spacing:1px}
.ty-inner p{font-family:'EB Garamond',serif;font-size:16.5px;color:var(--muted);margin-bottom:20px;line-height:1.6}
.ty-inner p b{color:var(--ink)}
.ty-box{margin-top:18px;padding:18px 20px;background:linear-gradient(160deg,rgba(216,180,106,.06) 0%,rgba(16,19,28,.5) 100%);border:1px solid var(--gold-dim);border-radius:14px;text-align:left}
.ty-box .lab{font-family:'Cinzel',serif;font-size:11.5px;color:var(--gold-bright);text-transform:uppercase;letter-spacing:1.5px;font-weight:700;margin-bottom:7px}
.ty-box p{font-family:'EB Garamond',serif;font-size:14.5px;color:var(--muted);margin:0 0 12px;line-height:1.5}
.ty-shop{margin-top:18px;font-family:'EB Garamond',serif;font-size:13.5px;color:var(--muted)}
.ty-shop a{font-family:'Cinzel',serif;font-size:11.5px;letter-spacing:1px;text-transform:uppercase}

@media (max-width:560px){
  .nav{padding:12px 18px}
  .hero{padding:70px 18px 40px}
  .eyebrow{letter-spacing:2.5px;font-size:10px}
  .hero h1{font-size:clamp(28px,8vw,38px)}
  .hero-tag{font-size:16px;max-width:340px}
  .film{border-radius:12px}
  .form-row .btn-primary{flex:1 1 100%}
  .form input[type="email"]{min-width:0}
}
</style>

<script async src="https://plausible.io/js/pa-XyfUV-SPa2VMk20wnbpyy.js"></script>
<script>
!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(Array.prototype.slice.call(arguments))};var n=window.pintrk;n.queue=[],n.version="3.0";var t=document.createElement("script");t.async=!0,t.src=e;var r=document.getElementsByTagName("script")[0];r.parentNode.insertBefore(t,r)}}("https://s.pinimg.com/ct/core.js");
pintrk('load','2613053380173',{np:'endocraft'});
pintrk('page');
</script>
<script>
  window.plausible=window.plausible||function(){(plausible.q=plausible.q||[]).push(arguments)},plausible.init=plausible.init||function(i){plausible.o=i||{}};
  plausible.init()
</script>
<link rel="icon" type="image/png" sizes="64x64" href="../assets/favicon-64.png">
<link rel="icon" type="image/png" sizes="32x32" href="../assets/favicon-32.png">
<link rel="apple-touch-icon" href="../assets/apple-touch-icon.png">
</head>
<body>

<nav class="nav">
  <div class="brand"><img src="../assets/logo-seal.png" class="brand-seal" alt="EndoCraft" width="28" height="28">ENDOCRAFT</div>
</nav>

<section class="hero">
  <div class="hero-inner">
    <span class="eyebrow">Free · for Curse of Strahd dungeon masters</span>
    <h1>Play them the valley.</h1>
    <p class="hero-tag">A cinematic arrival scene — <b>table-ready</b>. Play it the moment your party crosses into the valley, and let the mist do the talking.</p>

    <div class="film">
      <span class="film-badge">The Arrival · free scene</span>
      <video id="film" src="clips/arrival-cursed-valley.mp4" poster="arrival-poster.jpg" muted autoplay loop playsinline preload="auto"></video>
      <button class="sound-btn" id="soundBtn" type="button">♪ Sound on</button>
    </div>

    <form class="form" id="leadForm">
      <div class="form-row">
        <input type="email" id="email" placeholder="your@email.com" required autocomplete="email">
        <button class="btn-primary" type="submit" id="submitBtn">Send me the scene →</button>
      </div>
      <div id="formError"></div>
    </form>
    <p class="micro">The full <b>1080p MP4</b> lands in your inbox — yours to play at the table. No spam, unsubscribe anytime.</p>
    <div class="badges">
      <span class="badge" id="slotsBadge"><span class="dot"></span>Only 9 free spots left today</span>
      <a class="badge gw" href="https://www.tiktok.com/@theendocraft" target="_blank" rel="noopener">▸ Follow <b>@theendocraft</b> on TikTok — the scene enters you in this month's <b>free custom-clip giveaway</b></a>
    </div>
    <script>fetch("https://endocraft-production.up.railway.app/api/free-slots").then(function(r){return r.json()}).then(function(d){var t=(d&&typeof d.taken==="number")?d.taken:5;var n=Math.max(3,14-t);var el=document.getElementById("slotsBadge");if(el)el.innerHTML='<span class="dot"></span>Only '+n+' free spots left today';}).catch(function(){});</script>
  </div>
</section>

<!-- ===== secondary: what else we make ===== -->
<section class="v2sec">
  <div class="v2inner">
    <div class="v2kicker">This is just a taste</div>
    <h2 class="v2h">We turn campaigns into cinema.</h2>
    <p class="v2sub">Character cutscenes, boss reveals, whole-campaign trailers — cinematic NPC cards, VTT tokens &amp; location art, print-ready for Roll20 &amp; Foundry.<br><span class="v2code">Code <b>WELCOME10</b> &mdash; 10% off your first pack</span></p>
    <div class="v2grid">
      <a class="v2tile" href="https://www.etsy.com/listing/4531234914?utm_source=endocraft&utm_medium=free_page&utm_campaign=shop_dh" target="_blank" rel="noopener"><video src="shop/tile_dh.mp4" poster="shop/tile_dh_poster.jpg" muted autoplay loop playsinline preload="metadata"></video><div class="t">The Devil&rsquo;s Hound<small>Curse of Strahd encounter kit</small></div></a>
      <a class="v2tile" href="https://www.etsy.com/listing/4530867864?utm_source=endocraft&utm_medium=free_page&utm_campaign=shop_bloomrot" target="_blank" rel="noopener"><video src="shop/tile_bloomrot.mp4" poster="shop/tile_bloomrot_poster.jpg" muted autoplay loop playsinline preload="metadata"></video><div class="t">The Bloomrot Saint<small>Boss encounter kit</small></div></a>
      <a class="v2tile" href="https://www.etsy.com/listing/4528139082?utm_source=endocraft&utm_medium=free_page&utm_campaign=shop_dragons" target="_blank" rel="noopener"><video src="shop/tile_dragons.mp4" poster="shop/tile_dragons_poster.jpg" muted autoplay loop playsinline preload="metadata"></video><div class="t">Animated Dragons<small>Living encounter clips</small></div></a>
      <a class="v2tile" href="https://www.etsy.com/listing/4528136284?utm_source=endocraft&utm_medium=free_page&utm_campaign=shop_ambience" target="_blank" rel="noopener"><video src="shop/tile_ambience.mp4" poster="shop/tile_ambience_poster.jpg" muted autoplay loop playsinline preload="metadata"></video><div class="t">Animated Ambience<small>Living location scenes</small></div></a>
    </div>
    <a class="v2btn" href="https://www.etsy.com/shop/EndoCraft?utm_source=endocraft&utm_medium=free_page&utm_campaign=shop_all" target="_blank" rel="noopener">Browse the full shop on Etsy &rarr;</a>
  </div>
</section>

<footer class="foot">
  <img src="../assets/logo-seal.png" class="seal" alt="EndoCraft" width="40" height="40">
  <p>EndoCraft · <a href="https://endocraft.app">endocraft.app</a> · cinematic D&amp;D, made to order<br>
  Compatible with any 5e game — not affiliated with Wizards of the Coast.</p>
</footer>

<div class="thank-you" id="thankYou">
  <div class="ty-inner">
    <h2>The scene is on its way 🕯️</h2>
    <p>Check your inbox — your <b>table-ready arrival scene</b> is landing now. Not there in a minute? Peek in your spam folder.</p>
    <div class="ty-box">
      <div class="lab">Want your OWN campaign like this?</div>
      <p>We build custom arrival scenes, character cutscenes &amp; whole-campaign trailers — made to order, one revision on us.</p>
      <a href="https://www.etsy.com/shop/EndoCraft?utm_source=endocraft_free&amp;utm_medium=thank_you&amp;utm_campaign=made_to_order" target="_blank" rel="noopener" style="font-family:'Cinzel',serif;font-size:12px;letter-spacing:1px;text-transform:uppercase;border-bottom:1px solid var(--gold-dim);padding-bottom:1px">See what we make →</a>
    </div>
    <p class="ty-shop">Prepping the whole campaign? The Curse of Strahd packs are 10% off with <b>WELCOME10</b> · <a href="https://www.etsy.com/shop/EndoCraft?utm_source=endocraft_free&amp;utm_medium=thank_you&amp;utm_campaign=welcome10" target="_blank" rel="noopener">Browse on Etsy →</a></p>
  </div>
</div>

<script>
const API_BASE='https://endocraft-production.up.railway.app';
/* sound toggle for the hero film */
(function(){
  const v=document.getElementById('film'),b=document.getElementById('soundBtn');
  if(!v||!b)return;
  b.addEventListener('click',function(){
    v.muted=!v.muted;
    if(!v.muted){v.play().catch(function(){});b.textContent='♪ Sound off';if(window.plausible)window.plausible('FilmSoundOn');}
    else b.textContent='♪ Sound on';
  });
})();
function detectSource(){
  const p=new URLSearchParams(window.location.search);
  if(p.get('utm_source'))return p.get('utm_source');
  const ref=document.referrer||'';
  if(/pinterest/i.test(ref))return 'pinterest';
  if(/tiktok/i.test(ref))return 'tiktok';
  if(/instagram/i.test(ref))return 'instagram';
  if(/etsy/i.test(ref))return 'etsy';
  if(/google/i.test(ref))return 'google';
  return 'direct';
}
const form=document.getElementById('leadForm'),submitBtn=document.getElementById('submitBtn'),emailInput=document.getElementById('email'),errorEl=document.getElementById('formError'),thankYou=document.getElementById('thankYou');
form.addEventListener('submit',async(e)=>{
  e.preventDefault();
  const email=emailInput.value.trim().toLowerCase();
  if(!email||!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)){errorEl.innerHTML='<div class="error-msg">Please enter a valid email address.</div>';return;}
  errorEl.innerHTML='';submitBtn.disabled=true;submitBtn.textContent='Sending…';
  const source=detectSource();
  try{
    const res=await fetch(API_BASE+'/api/free-pack/subscribe',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({email,source,utm:window.location.search||null})});
    if(!res.ok&&res.status!==409){const d=await res.json().catch(()=>({}));throw new Error(d.error||'Network error');}
    try{localStorage.setItem('endocraft_free_email',email);}catch(_){}
    thankYou.classList.add('show');
    if(window.plausible)window.plausible('SceneSignup',{props:{source:source}});
    if(window.pintrk)window.pintrk('track','lead',{lead_type:'free_scene'});
  }catch(err){
    errorEl.innerHTML='<div class="error-msg">Something went wrong: '+(err.message||'unknown')+'. Try again in a moment.</div>';
    submitBtn.disabled=false;submitBtn.textContent='Send me the scene →';
  }
});
try{if(localStorage.getItem('endocraft_free_email')){emailInput.value=localStorage.getItem('endocraft_free_email');}}catch(_){}
</script>

</body>
</html>
