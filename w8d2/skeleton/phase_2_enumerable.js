Array.prototype.myEach = function (callback) {
    
  for (let i = 0; i < this.length; i++) {
   callback(this[i]);
  }
}

// function callback(el) {
//   console.log(el)
// }
// let arr = [1, 2, 3, 4]

// arr.myEach(callback) // works
// arr.myEach(callback(el)) // doesnt work
// arr.myEach((el) => { callback(el) })  // works and dont know why


//works but we rewrote each

// Array.prototype.myMap = function(callback) {
//   let newArr = [];
//   for (let i = 0; i < this.length; i++) {
//     newArr.push(callback(this[i]));
//   }
//   return newArr
// }

// function doubler(el) {
//   return el * 2
// }

// let arr = [1, 2, 3, 4]

// console.log(arr.myMap(doubler))






Array.prototype.myMap = function (callback) {
  const newArr = []
  this.myEach((el) => { newArr.push(callback(el)) })
  // arr.myeach {|el| newArr << prc.call(el)}

return newArr
}

function doubler(el) {
    let temp = el * 2;
    // console.log(temp)
    return temp
}

// let arr = [1, 2, 3, 4]

// console.log(arr.myMap(doubler))


// const singers = function(){
//     const popStars = ["the weekend"];
//     return function(newSinger){
//         popStars.push(newSinger);
//         return `I have listened to ${popStars.join(' and ')}`;
//     }
// }



Array.prototype.myInject = function(func, firstel){
    // let acc;  
    // if (!firstel) {
    // acc = this.shift();
    // }else{
    //     acc = firstel;
    // }

    let acc = !firstel ? this.shift() : firstel
 
    this.myEach((el) => { acc = func(acc, el) });
    // arr.myeach {|el| prc.call(el)}

    return acc;
}

function func(acc, el) {
    let temp = acc * el;
    // console.log(temp)
    return temp
}


// let test = [1,2,3,4,5,6,7]
// console.log(test.myInject(func, 2 ))




