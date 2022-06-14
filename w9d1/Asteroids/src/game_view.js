const Game = require("./game")
const Keymaster = require("../dist/keymaster");
const Bullet = require("./bullet")

function GameView(ctx){
  
  GameView.MOVES = {
      "w": [0, -1],
      "a": [-1, 0],
      "s": [0, 1],
      "d": [1, 0],
  };

    this.game = new Game();
    this.ctx = ctx;
}


GameView.prototype.start = function(){


//   setInterval(this.game.move(), 100)
let that = this;

setInterval(function () {
    that.game.step();
    that.game.draw(that.ctx);
    }, 50)

this.bindKeyHandlers()
  
}

GameView.prototype.bindKeyHandlers = function(){
//   let that = this;
//     for(var k in GameView.MOVES){
//         console.log(that.game.ship)
//         const move = GameView.MOVES[k];
//       key(k, function (k) {that.game.ship.power(move)})
//     }
// console.log(this.game.ship)
    const ship = this.game.ship;
    Object.keys(GameView.MOVES).forEach(function (k) {
        const move = GameView.MOVES[k];
        key(k, function () { ship.power(move); });
    });
  // if (key.isPressed("space")) {console.log(ship.fireBullet()); this.game.add(ship.fireBullet())}
  	    key("space",  () => { this.game.add(ship.fireBullet()) });


}

module.exports = GameView;
