var sum = function() {
  var args = Array.prototype.slice.call(arguments);
  var total = 0;

  args.forEach(function(el) {
    total += el;
  })

  return total;
}

// console.log(sum(3, 4, 6, 3, 4));

Function.prototype.myBind = function(object) {
  var that = this;
  var that_args = Array.prototype.slice.call(arguments, 1);

  return function() {
    var more_args = Array.prototype.slice.call(arguments);
    return that.apply(object, that_args.concat(more_args));
  }
}

var myBoundFunction = sum.myBind(this, 1, 2);
// console.log(myBoundFunction(3));

var curriedSum = function(numArgs) {
  var numbers = [];

  var _curriedSum = function(num) {
    numbers.push(num);

    if (numbers.length == numArgs) {
      var total = 0;

      numbers.forEach(function(n) {
        total += n;
      })

      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

// var sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
  var args = [];
  var that = this;

  var _chicken = function (num) {
    args.push(num);

    if (args.length === numArgs){
      return that.apply(that, args);
    } else {
      return _chicken;
    }
  }

  return _chicken;
}

// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }
//
// sumThree(4, 20, 3); // == 27
//
// // you'll write `Function#curry`!
// var f1 = sumThree.curry(3);
// var f2 = f1(4);
// var f3 = f2(20);
// var result = f3(3); // = 27
//
// // or more briefly:
// console.log(sumThree.curry(3)(4)(20)(3)); // == 27