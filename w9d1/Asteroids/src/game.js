const moving_object = require("./moving_object")
const Asteroid = require("./asteroid")
const Ship = require("./ship")
const Bullet = require("./bullet.js");

function Game(){
  Game.DIM_X = 640;
  Game.DIM_Y = 640;
  Game.NUM_ASTEROIDS = 20;
  //  Game.NUM_ASTEROIDS = 20; @@NUM Asteroids
  this.asteroidArr = this.add_asteroids();
  this.ship = new Ship();
  this.bullets = []
  //this.asteroidArr = @asteroidArr
  this.allObjects = this.asteroidArr.concat([this.ship]).concat(this.bullets);
}

Game.prototype.add_asteroids = function(){
    let asteroidsArr = []
    while (asteroidsArr.length < Game.NUM_ASTEROIDS) {
    let a = new Asteroid ([Math.random()*Game.DIM_X,Math.random()*Game.DIM_Y]);
    a.id = asteroidsArr.length
    asteroidsArr.push(a);
    }
    return asteroidsArr;
}

Game.prototype.add = function (obj) {
  if (obj.constructor === Bullet){
    this.bullets.push(obj);
  } else if (obj.constructor === Asteroid){
      this.asteroidArr.push(obj);
  }
}

Game.prototype.draw = function(ctx){
  ctx.clearRect(0,0,Game.DIM_X, Game.DIM_Y)
  // this.asteroidArr.forEach(el => el.draw() ) 
  this.allObjects = this.asteroidArr.concat([this.ship]).concat(this.bullets);
  this.allObjects.forEach(function (el) { el.draw(ctx)})

}

Game.prototype.move = function(){
  this.allObjects.forEach(function(el) {el.move()})
  let that = this;
  this.allObjects.forEach(function(el) {that.wrap(el.pos)} )
}

Game.prototype.wrap = function(pos){
  if (pos[0] > Game.DIM_X) {pos[0] = pos[0] % Game.DIM_X}
  if (pos[1] > Game.DIM_Y) {pos[1] = pos[1] % Game.DIM_Y}
  if (pos[0] < 0) { pos[0] = (pos[0] + Game.DIM_X) }
  if (pos[1] < 0) { pos[1] = (pos[1] + Game.DIM_Y) }

}

Game.prototype.step = function (){
  this.move();
  this.checkCollisions();
}


Game.prototype.remove = function (obj){
    console.log("remove")
if (obj.constructor === Asteroid){
  let idx = this.asteroidArr.indexOf(obj)
  // let astr = this.asteroidsArr
  if (idx === this.asteroidArr.length - 1) { this.asteroidArr = this.asteroidArr.splice(0,idx) } else if (idx === 0) {this.asteroidArr = this.asteroidArr.splice(1)} else{this.asteroidArr = this.asteroidArr.splice(0,idx).concat(this.asteroidArr.splice(idx+1)) }

  //maybe refactor with filter
} else if (obj.constructor === Bullet){
    let idx = this.bullets.indexOf(obj)
    if (idx === this.bullets.length - 1) { this.bullets = this.bullets.splice(0, idx) } else if (idx === 0) { this.bullets = this.bullets.splice(1) } else { this.bullets = this.bullets.splice(0, idx).concat(this.bullets.splice(idx + 1)) }
}
}

// Game.prototype.remove = function (obj1, obj2) {
//   // let astr = this.asteroidsArr
//   this.asteroidArr = this.asteroidArr.filter(function (el) {el !== obj1 || el !== obj2} )
//   //maybe refactor with filter
// }


Game.prototype.checkCollisions = function(){
    for(let i =0; i< this.asteroidArr.length; i++){
        // for(let j=0; j< this.allObjects.length;j++){
          // console.log(this.asteroidArr[i])
          
        if(this.asteroidArr[i].isCollidedWith(this.ship)){ 
                console.log(this.ship.reloc)
                console.log(this.ship.pos)
                this.ship.reloc();
                // this.ship.pos = [Math.random() * 640, Math.random() * 640]
            //   console.log(`AsterArr i ${this.asteroidArr[i].id}`)
            //   console.log(`AsterArr j ${this.asteroidArr[j].id}`)
            //     // this.remove(this.asteroidArr[i], this.asteroidArr[j]);
            //     // console.log(`AsterArr j ${this}`)
            //     this.remove(this.asteroidArr[i]);
            //     console.log(`AsterArr j ${this.asteroidArr[j-1].id}`)
            //     this.remove(this.asteroidArr[j-1]);
            //     return;
        }
        }
    }



module.exports = Game;
