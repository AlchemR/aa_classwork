const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
const Bullet = require("./bullet.js");

function Ship() {
  Ship.COLOR = "#ff0000";
  Ship.RADIUS = 5;
  MovingObject.call(this, {
    pos: [Math.random() * 640, Math.random() * 640],
    vel: [0,0],
    color: Ship.COLOR,
    radius: Ship.RADIUS
  })
}

Util.inherits(Ship, MovingObject);

Ship.prototype.reloc = function(){
  this.pos = [Math.random() * 640, Math.random() * 640]
  // this.vel = [0,0]
}

Ship.prototype.power = function (impulse){
    this.vel[1] += impulse[1]
    this.vel[0] += impulse[0]
}

Ship.prototype.fireBullet = function (){
   let bullet = new Bullet(this.pos, this.vel);
   return bullet;
}

module.exports = Ship;
