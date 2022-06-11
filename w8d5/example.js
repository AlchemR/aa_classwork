

function continuosAdd() {
  const args = [];

  return function _curriedAdd(num) {
    args.push(num);
    console.log(args.reduce((acc, ele) => {
      return acc + ele;
    }));
    return _curriedAdd; // without, the next time we invoke our curriedAdd, there wont be a return value.
  };
}

let calculator1 = continuosAdd(2)
console.log(continuosAdd);
console.log(calculator1)
calculator1 = calculator1(2)
console.log(calculator1)

;