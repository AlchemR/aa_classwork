Array.prototype.myBubbleSort = function() {
    let sorted = false;
    let temp;
    while(!sorted){
        sorted = true;
        for(let i = 0; i < this.length-1; i++){
            if ((i != this.length-1) && (this[i] > this[i+1])) {
                temp = this[i];
                this[i] = this[i+1];
                this[i+1] = temp;
                sorted = false;
            }
        }
    }
    return this
}

// let test = [9,1,4,7,3,6,4];
// console.log(test.myBubbleSort());
// sorted = false
// while sorted == false
//   sorted = true

// arr.each_with_index do | el, idx |
// if idx != arr.length - 1
//   if el[idx] > el[idx + 1]
//   temp = el[idx]
// el[idx] = el[idx + 1]
// el[idx + 1] = temp
// sorted = false
// end
// end


// String.prototype.mySubstring = function(){
//   let stringarr = this.split();
//   let outarr = []
 
//   for (let i = 0; i < this.length - 1; i++){
//     outarr.push(stringarr[i])
//     for (let j = 0; j < this.length - 1; j++){
//       if (j > i){
//       outarr.push(stringarr.slice(i,-(j-this.length))) //added a ) and removed a [ from before the stringarr
      
//       }
//     }
//   }
// return outarr 
// }

String.prototype.mySubstring = function(){
    // let windowSize = 0;
    let subStr = [];
    let limit = this.length-1
    let oldStr = this.split("");
    console.log(oldStr)
  for (let i = 0; i < this.length; i++){        
        subStr.push([oldStr[i]]);
        for (let j = 0; j < this.length; j++){
            if (j != limit){
                let temp = oldStr.slice(i, j+1);
                subStr.push(temp);
            }
        }
    }
    return subStr;
 }

let stringTest = "abcd"

console.log(stringTest.mySubstring())

// let str = "thisisanothertest";
// let thing = str.split("");
// let theSlice = thing.slice(1,5)
// console.log(theSlice);
// console.log(thing);