Function.prototype.myBind = function (context) {
    console.log(this);
    return ()=>{ this.call(context) }

//  let that = this 
//  return function () {that.call(context)}
}


class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function () {
  console.log("Turning on " + this.name);
};

const lamp = new Lamp();

// turnOn(); // should not work the way we want it to

// const boundTurnOn = turnOn.bind(lamp);
// boundTurnOn(); // should say "Turning on a lamp"

const myBoundTurnOn = turnOn.myBind(lamp);
myBoundTurnOn(); // should say "Turning on a lamp"


// function b()
// {
//     console.log(`what is this: ${this}`)
//     this.num = 1;
//     let v = ()=>{ console.log(this.num) }
//     v();
// }
// let bob = new b();

// console.log(b());
