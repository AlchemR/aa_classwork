// Function.prototype.myDebounce = function(interval)
// {
//     let timer;
//   if (timer === undefined) 
//   {
//     clearTimeout(timer)
//   }
 

//   let func = (...args) => {
//       this(...args);
//   } 
//   timer = setTimeout(() => {return func} , interval);

  
// }


Function.prototype.myDebounce = function(interval) {
 let timer;
 let that = this;
 return function() {
   
   clearTimeout(timer)
   timer = setTimeout(() => that.apply(this), interval)
 };

//  let timer;
//  return (...args) => {
   
//    clearTimeout(timer)
//    timer = setTimeout(() => this(...args), interval)
//  };


 
}


class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}



const searchBar = new SearchBar();

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};


searchBar.search = searchBar.search.myDebounce(500);
queryForHelloWorld();