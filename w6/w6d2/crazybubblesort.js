var readline = require('readline');
var READER = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

var askLessThan = function(el1, el2, callback) {
  READER.question("Is " + el1 + " smaller than " + el2 + "? ", function(answer) {
    if (answer === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });
}

var performSortPass = function(arr, i, madeAnySwaps, callback) {
  if (i < arr.length - 1) {
    askLessThan(arr[i], arr[i + 1], function(lessThan){
      if (lessThan === false) {
        var tmp = arr[i];
        arr[i] = arr[i + 1];
        arr[i +1] = tmp;
        madeAnySwaps = true;
      }

      performSortPass(arr, i + 1, madeAnySwaps, callback);
    })
  }

  if (i === (arr.length - 1)) {
    callback(madeAnySwaps);
  }
}

var crazyBubbleSort = function(arr, sortCompletionCallback) {
  var sortPassCallback = function (madeAnySwaps){
    if (madeAnySwaps === true){
      performSortPass(arr, 0, false, sortPassCallback);
    } else {
      sortCompletionCallback(arr);
      READER.close();
      return;
    }
  }

  sortPassCallback(true);
}

crazyBubbleSort([3, 2, 4, 1], function (arr) { console.log(arr) });