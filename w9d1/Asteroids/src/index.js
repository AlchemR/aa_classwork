const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;

const Game = require("./game.js");
window.Game = Game;

const GameView = require("./game_view.js");
window.GameView = GameView;

window.addEventListener('DOMContentLoaded', (event) => {
    canvas = document.getElementById('game-canvas')
    canvas.getContext('2d');
  const game = new GameView(canvas.getContext("2d"));
    window.game = game;
    window.allobjects = game.allobjects
  window.ship = game.ship
    game.start();
    // game.draw(canvas.getContext("2d"));
    // game.move();
    // game.draw(canvas.getContext("2d"));
    // game.move();
    // game.draw(canvas.getContext("2d"));
    // game.move();
    // const mo = new MovingObject({ pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00" });
    // window.mo = mo
    // mo.draw(canvas.getContext("2d"));
    // console.log(mo)
    // const a = new Asteroid([40,40]);
    // a.draw(canvas.getContext("2d"))
    // console.log(a)
    // window.a = a
    // mo.move()
    // mo.draw(canvas.getContext("2d"));
    // mo.move()
    // mo.draw(canvas.getContext("2d"));
    // mo.move()
    // mo.draw(canvas.getContext("2d"));
    // mo.move()
    // mo.draw(canvas.getContext("2d"));
    // mo.move()
    // mo.draw(canvas.getContext("2d"));
});



