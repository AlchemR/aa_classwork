class Clock {
  constructor() {
    let clockdate = new Date();
    
    this.hours = clockdate.getHours();
    this.minutes = clockdate.getMinutes();
    this.seconds = clockdate.getSeconds();
    setInterval(this._tick.bind(this), 1000);
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
  }

  _tick() {
    this.seconds +=1 ;
    if (this.seconds >= 60 ){ this.minutes += 1 , this.seconds = 0 } ;
    if ( this.minutes >= 60) {this.hours += 1, this.minutes -= 60} ;
    if (this.hours >= 24) { this.hours = 0} ;
    this.printTime();
    // 1. Increment the time by one second.
    // 2. Call printTime.
  }
}

const clock = new Clock();
// clock.printTime();
console.log("hi")