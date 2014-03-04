Array.prototype.multiples = function(){
  var result = [];
  
  for(var i = 0; i < this.length; i++){
    result.push(this[i] * 2);
  }
  
  return result;
}

var myEach = function(array, func) {
  for(var i = 0; i < array.length; i++) {
    func(array[i]);
    // console.log(func(array[i]));
  }
  
  return array;
}

// console.log(myEach([1,2,3], function(element){ return element + 4 }))

var myMap = function(array, mapFunc) {
  var result = [];
  
  var insideFunction = function(el) { result.push(mapFunc(el)) }
  myEach(array, insideFunction )
  return result;
}

// console.log(myMap([1,2,3], function(element){ return element + 4 }))

var myInject = function(array, func) {
  var total = array.shift(1);
  var iFunction = function(el) { total = func(total, el) }
  myEach(array, iFunction);
  return total;
}

//OR 

Array.prototype.myInject = function(func) {
  var result = this[0];
  
  this.slice(1).myEach(function(element) {
    result = func(result, element);
  });
}

// console.log(myInject([1,2,10], function(sum ,element){ return sum * element  }))