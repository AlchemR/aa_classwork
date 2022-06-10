const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

 function addNumbers(sum, numsleft, cb){
  if (numsleft > 0 ){
  reader.question('Please enter a number\n', (res) => {

    let num = parseInt(res);
    sum += num; 
    console.log(`${sum}`);
    addNumbers(sum, numsleft - 1, cb);
  });
  } 
  else
  {
    cb(sum)
    reader.close();
  }
 }

 addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));