// 

bbbb = 0;
console.log(`first: ${bbbb}`);
function a(){
    this.bbbb = 1;
}
a();
console.log(`second: ${bbbb}`);

let cow = function(){
    this.bbbb = 17;
}
cow();
console.log(`third: ${bbbb}`);

let dog = (() => {
    this.bbbb = 857;
})
dog();
console.log(`fourth: ${bbbb}`);

Function.prototype.tester = function()
{
    this.bbbb = 3;
    console.log(this);
    return (this);
}

a.tester();
console.log(`fifth: ${bbbb}`);