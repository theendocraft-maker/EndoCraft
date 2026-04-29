// dice-worker.js — cannon.js physics auf eigenem Thread
importScripts('https://cdn.jsdelivr.net/npm/cannon@0.6.2/build/cannon.min.js');

var world, diceBody, tickId;
var settleFrames = 0, settled = false, lastBounceTs = 0;

function init(cfg) {
  world = new CANNON.World();
  world.gravity.set(0, -24, 0);
  world.broadphase = new CANNON.NaiveBroadphase();
  world.solver.iterations = 8;

  var gMat = new CANNON.Material('g');
  var gb = new CANNON.Body({ mass: 0, material: gMat });
  gb.addShape(new CANNON.Plane());
  gb.quaternion.setFromAxisAngle(new CANNON.Vec3(1,0,0), -Math.PI/2);
  world.addBody(gb);

  var dMat = new CANNON.Material('d');
  world.addContactMaterial(new CANNON.ContactMaterial(gMat, dMat, {
    friction: 0.30, restitution: 0.44
  }));

  diceBody = new CANNON.Body({ mass: 1, material: dMat, linearDamping: 0.18, angularDamping: 0.26 });
  diceBody.addShape(new CANNON.Sphere(cfg.r));
  diceBody.position.set(cfg.sx, 5.5, cfg.sz);
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
  var grounded = p.y < 0.92 + 0.28;
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
