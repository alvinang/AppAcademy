function Clock(){
  var currentTime = new Date();
  this.hours = currentTime.getHours();
  this.minutes = currentTime.getMinutes();
  this.seconds = currentTime.getSeconds();
}

Clock.prototype.run = function(){
  // var func = this.tick.bind(this);
  // setInterval(func, 5000);

  var that = this;
  setInterval(function () {
    that.tick();
  }, 5000)
}

Clock.prototype.tick = function(){
  this.seconds += 5

  if (this.seconds > 60) {
    this.seconds -= 60;
    this.minutes += 1;
  }

  if (this.minutes > 60) {
    this.minutes -= 60;
    this.hours += 1;
  }

  if (this.hours > 24) {
    this.hours -= 24;
  }

  console.log(this.hours + ":" + this.minutes + ":" + this.seconds);
}


var clock = new Clock();
clock.run();


var readline = require('readline');
var READER = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback){

  if (numsLeft > 0) {
    READER.question("Enter a number! You have "+numsLeft+" nums left     ", function(num){
      sum += parseInt(num);
      console.log(sum);
      addNumbers(sum, numsLeft - 1, completionCallback)
    });


  }

  if (numsLeft === 0) {
    completionCallback(sum);
    console.log(sum);
    READER.close();
    return;
  }
}

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
});

