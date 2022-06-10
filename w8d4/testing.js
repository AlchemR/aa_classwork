
function Cat(name) {
  this.name = name;
}

Cat.prototype.meow = function () {
  console.log(`${this.name} says 'meow'`);
};

Cat.prototype.sayHi = function() {
  const that = this;
  console.log("outside the inner function", this);

  // option 1:

  test = () => {
  console.log("inside the inner function", this);
  timesDo(3, that.meow.bind(that));
  }

  test();


function timesDo(num, cb) {
  for (let i = 0; i < num; i++) {
    cb();
  }
}


  // option 2:

  // return () => {
  //   timesDo(3, this.meow.bind(this));
  // }

  // option 3:

  // return () => {
  //   timesDo(3, () => this.meow());
  // }

}


let garfield = new Cat("Garfield");
console.log(garfield.sayHi());