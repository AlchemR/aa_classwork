
Array.prototype.uniq = function() {
let array2 = []; // output array
  
  for (let i = 0; i < this.length; i++) {
    if (!array2.includes(this[i])){ 
      array2.push(this[i]);
    }
    // if not in new array, add it to array
    // if in new Array, skip over it (continue, not break)
  }

  return array2;
}

// let atest = new Array(); // set to empty array
// atest = [1,2,3,4,5,4,3,6,7];
// also works this way
// let atest = [1, 2, 3, 4, 5, 4, 3, 6, 7];

// console.log(Array.uniq(atest))
// console.log(Array.prototype.uniq(atest))

// console.log(atest.uniq())
// console.log(Array.prototype.uniq(atest))


Array.prototype.twosum = function() {
    let newArr = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this.length; j++) {
            if (i < j && this[i]+this[j]===0){
                newArr.push([i, j]);
            }
        }
    }
    return newArr;
}

// let twotest = [1,2,3,4,-2,3,-4]; //  should [1,4], [3,6]
// console.log(Array.prototype.twosum(twotest))


Array.prototype.transpose = function() {
  let arrOut = [];
  for (let i = 0; i < this.length; i++) {
    let temp = [];
    for (let j = 0; j < this.length; j++) {
      temp.push(this[j][i])
    }
    arrOut.push(temp);
  }
  return arrOut;
} 


// let transposetest = [[1, 2, 3, 4, 5], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5]];  //[1,1,1,1,1], [2,2,2,2,2], [3,3,3,3,3], [4,4,4,4,4], [5,5,5,5,5]

// console.log(Array.prototype.transpose(transposetest))


