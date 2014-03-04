var bubbleSort = function(array) {
  var sorted = false;

  while(sorted === false) {
    sorted = true;
    for(var i = 0; i < array.length; i++) {
      if (array[i] > array[i + 1]) {
        var left = array[i];
        array[i] = array[i + 1];
        array[i+1] = left;
        
        sorted = false;
      }
    }
  }
  
  return array;
}

// console.log(bubbleSort([1,3,6,4,2]))

var substrings = function(string) {
  var result = [];
  
  for (var i = 0; i < string.length; i++) {
    for (var j = i + 1; j <= string.length; j++) {
      result.push(string.substring(i,j));
    }
  }
  
  return result;
}

console.log(substrings("cat"));