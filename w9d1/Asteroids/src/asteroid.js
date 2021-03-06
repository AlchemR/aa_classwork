const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");


function Asteroid(pos) {
  Asteroid.COLOR = "#2803fc";
  Asteroid.RADIUS = 10;
    MovingObject.call(this, {
        pos: pos,
        vel: [Math.random() * 10, Math.random() * 10],
        color: Asteroid.COLOR,
        radius: Asteroid.RADIUS
    })
   

}

Asteroid.prototype.collidedWith = function(otherObject){
    console.log("colided")
    if (otherObject.constructor === Ship && this.isCollidedWith(otherObject)){
        otherObject.relocate();
    }

}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;
