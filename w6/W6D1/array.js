Array.prototype.dups = function() {
  var result = [];
  for(var i=0;i<this.length;i++){
    if (result.indexOf(this[i]) === -1)
    {
      result.push(this[i]);
    }
  }
  return result;
}

// console.log([1,1,1,2,2,2,3].dups());


Array.prototype.twoSum = function() {
  var result = [];
  for(var i=0; i<this.length - 1; i++){
    for(var j=i+1; j<this.length; j++){
      if (this[i] + this[j] === 0)
      {
        result.push([i,j]);
      }
    }
  }
  return result;
}

// console.log([-2, -1, 0, 1, 2].twoSum())

var myTranspose = function(arr) {
  var result = []
  for(var i=0; i<arr.length; i++){
    result.push([])
  }
  for(var j=0; j<arr.length; j++){
    for(var k=0; k<arr[j].length; k++){
      result[k].push(arr[j][k])
    }
  }
  return result
}
