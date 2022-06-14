// const Game = require("./game")

function MovingObject (object){
    this.object = object;
    this.pos = object.pos
    this.vel = object.vel
    this.radius = object.radius
    this.color = object.color
//   }

  // this.object = {
  //   object.pos = pos
  //   object.vel = vel
  //   object.radius = radius
  //   object.color = "00FF00"
  // }
}

const mo = new MovingObject({ pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00" });


MovingObject.prototype.draw = function(ctx){
  
ctx.beginPath(); // i think this is making a line -- path makes a line between two points
ctx.fillStyle = this.color;
ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI)
  // ctx.arc(this.object["pos"][0], this.object["pos"][1], this.object["radius"], 0, 2 * Math.PI)
// ctx.stroke(); // this tells it to draw
ctx.fill()

}

MovingObject.prototype.move = function (){
  this.pos[0] += this.vel[0]
  this.pos[1] += this.vel[1]
}

// Circle.prototype.moveRandom = function (maxX, maxY) {
//   this.centerX = Math.abs((this.centerX + (dx * this.radius * 0.1)) % maxX);
//   this.centerY = Math.abs((this.centerY + (dy * this.radius) * 0.1) % maxY);
// };

MovingObject.prototype.isCollidedWith = function (other) {
  let dist = Math.sqrt((this.pos[0] - other.pos[0]) ** 2 + (this.pos[1] - other.pos[1]) ** 2)
  if (dist < (this.radius + other.radius)) {return true;} 
  return false;
}

MovingObject.prototype.collidedWith = function (otherObject) {}



module.exports = MovingObject;
