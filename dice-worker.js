// dice-worker.js — cannon.js physics auf eigenem Thread
importScripts('https://cdn.jsdelivr.net/npm/cannon@0.6.2/build/cannon.min.js');

var world, diceBody, tickId;
var settleFrames = 0, settled = false, lastBounceTs = 0;

function makeIcosahedron(r) {
  var phi = (1 + Math.sqrt(5)) / 2;
  var s = r / Math.sqrt(1 + phi * phi);
  var sp = s * phi;
  var verts = [
    new CANNON.Vec3( 0,  s,  sp), new CANNON.Vec3( 0, -s,  sp),
    new CANNON.Vec3( 0,  s, -sp), new CANNON.Vec3( 0, -s, -sp),
    new CANNON.Vec3( s,  sp,  0), new CANNON.Vec3(-s,  sp,  0),
    new CANNON.Vec3( s, -sp,  0), new CANNON.Vec3(-s, -sp,  0),
    new CANNON.Vec3( sp,  0,  s), new CANNON.Vec3(-sp,  0,  s),
    new CANNON.Vec3( sp,  0, -s), new CANNON.Vec3(-sp,  0, -s)
  ];
  var faces = [
    [0,1,8],[0,8,4],[0,4,5],[0,5,9],[0,9,1],
    [1,6,8],[8,6,10],[8,10,4],[4,10,2],[4,2,5],
    [5,2,11],[5,11,9],[9,11,7],[9,7,1],[1,7,6],
    [3,6,7],[3,10,6],[3,2,10],[3,11,2],[3,7,11]
  ];
  return new CANNON.ConvexPolyhedron(verts, faces);
}

function init(cfg) {
  world = new CANNON.World();
  world.gravity.set(0, -24, 0);
  world.broadphase = new CANNON.NaiveBroadphase();
  world.solver.iterations = 10;

  var gMat = new CANNON.Material('g');

  // Ground
  var gb = new CANNON.Body({ mass: 0, material: gMat });
  gb.addShape(new CANNON.Plane());
  gb.quaternion.setFromAxisAngle(new CANNON.Vec3(1,0,0), -Math.PI/2);
  world.addBody(gb);

  // Invisible walls — keep die inside ±2.0 in X and Z
  var W = 2.0, H = 4, T = 0.1;
  [[W+T, H, 0, T, H, W+T], [-(W+T), H, 0, T, H, W+T],
   [0, H,  W+T, W+T, H, T], [0, H, -(W+T), W+T, H, T]
  ].forEach(function(w) {
    var wb = new CANNON.Body({ mass: 0, material: gMat });
    wb.addShape(new CANNON.Box(new CANNON.Vec3(w[3], w[4], w[5])));
    wb.position.set(w[0], w[1], w[2]);
    world.addBody(wb);
  });

  var dMat = new CANNON.Material('d');
  world.addContactMaterial(new CANNON.ContactMaterial(gMat, dMat, {
    friction: 0.50, restitution: 0.40
  }));

  diceBody = new CANNON.Body({ mass: 1, material: dMat, linearDamping: 0.25, angularDamping: 0.40 });
  diceBody.addShape(makeIcosahedron(cfg.r));
  diceBody.position.set(cfg.sx, cfg.sy || 2.5, cfg.sz);
  diceBody.velocity.set(cfg.vx, cfg.vy, cfg.vz);
  diceBody.angularVelocity.set(cfg.avx, cfg.avy, cfg.avz);
  world.addBody(diceBody);

  settled = false; settleFrames = 0; lastBounceTs = 0;
  if (tickId) clearInterval(tickId);
  tickId = setInterval(tick, 1000/60);
}

function tick() {
  if (settled) return;
  world.step(1/60, 1/60, 4);

  var p = diceBody.position, q = diceBody.quaternion;
  var vel = diceBody.velocity.length();
  var angVel = diceBody.angularVelocity.length();
  var grounded = p.y < 1.20;
  var now = Date.now();

  var bounce = false;
  if (grounded && vel > 0.9 && now - lastBounceTs > 160) {
    bounce = true; lastBounceTs = now;
  }

  if (grounded && vel < 0.07 && angVel < 0.10) {
    settleFrames++;
    if (settleFrames >= 18) {
      settled = true;
      clearInterval(tickId);
      self.postMessage({ t: 'settled', x: p.x, y: p.y, z: p.z, qx: q.x, qy: q.y, qz: q.z, qw: q.w });
      return;
    }
  } else if (grounded && vel > 0.15) {
    settleFrames = 0;
  }

  self.postMessage({ t: 'f', x: p.x, y: p.y, z: p.z, qx: q.x, qy: q.y, qz: q.z, qw: q.w, bounce: bounce, vel: vel });
}

self.onmessage = function(e) {
  var d = e.data;
  if (d.t === 'init') init(d);
  else if (d.t === 'stop') { if (tickId) clearInterval(tickId); }
};
