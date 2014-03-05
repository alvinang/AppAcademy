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