// function sum (args){
// sum41 = 0;

// for (let i = 0 ; i < args.length; i++){
//   sum41 += args[i]
// }
// return sum41
// }

// // let arr = [1,2,3,4]
// // let arr1 = [1, 2, 3, 4, 5]

// // console.log(sum(arr))
// // console.log(sum(arr1))

// function sum(...banana) {  /// (*banana)
//   sum41 = 0;

//   for (let i = 0; i < banana.length; i++) {
//     sum41 += banana[i]
//   }
//   return sum41
// }

// // let arr = [1, 2, 3, 4]
// // let arr1 = [1, 2, 3, 4, 5]

// // console.log(sum(arr))
// // console.log(sum(arr1))
// // console.log(sum(1, 2, 3, 4, 5,6,7,8))
// // gconsole.log(sum(arr)



// console.log(sum(1, 2, 3, 4, 5))




// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");







// // es6
// // function myBind(context) {
// //   that = this
// //   return ()=> {return this.context}
// // }

// // es5
// Function.prototype.myBind = function(context){ // arguements = arg1, arg2, arg3
//   let that = this;
//   const bArgs = Array.from(arguments).slice(1);
//   return function (){
//       const cArgs = Array.from(arguments);
//     return that.apply(context, bArgs.concat(cArgs));
//   };

// }

// Function.prototype.myBind3 = function(context, ...bindArgs){
//     let that = this;
//     return function (...callArgs){
//         return that.apply(context, bindArgs.concat(callArgs))
//     }
// }



// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// //  ${this.name} says ${sound} to ${person}!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // says.pavlov.apply(pavlov, meow, kush)
// //  says(sound, person)
// //  ${this.name} says ${sound} to ${person}!
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // markov.says.myBind()();
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// //                  (context, ...args) (...argies)
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!


// true

// ======================================================================





// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

// sumThree(4, 20, 6); // == 30

// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30



// function curriedSum(numArgs){
//   let numbers = [];
//   let number1= 0;

//   return function  _chickenTikka (num){
//     numbers.push(num);
//     number1 += num
//     if (numbers.length === numArgs) {
//       return numbers.reduce((acc,ele) => acc+ele)
//     }    
//     return _chickenTikka;
//   }
// }


// const sumo = curriedSum(4);
// console.log(sumo(5)(30)(20)(1)); // => 56


Function.prototype.curry = function (numArgs){

let sumArr = [];
let that = this;
return function _courier(num){
if (sumArr.length === numArgs.length){
  return that.apply(that, sumArr)
}
return _courier;
}

};

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
  }

console.log(sumThree.curry(3)(4)(20)(6))
; // == 30