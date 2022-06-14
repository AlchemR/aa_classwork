const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");

function Bullet(pos, vel) {
  Bullet.COLOR = "#505050";
  Bullet.RADIUS = 10;
MovingObject.call(this, {
    pos: pos, // shoul0 be ship
    vel: [vel[0]*2, vel[1]*2],
    color: Bullet.COLOR,
    radius: Bullet.RADIUS
  })
}

Util.inherits(Bullet, MovingObject);



module.exports = Bullet;
