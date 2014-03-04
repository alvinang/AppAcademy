var range        = function(start,end) {
  if(start + 1 === end)
  {
    return [];
  }
  // return range(start+1,end).push(start);
  result         = range(start, end - 1)
  result.push(end-1)
  return result
}

// console.log(range(1,8));

var sumArray     = function(arr) {
  if (arr.length === 1)
  {
    return arr[0]
  }
  var sum        = arr.pop() + sumArray(arr);
  return sum;
}

// console.log(sumArray([1,2,3]))


var recursionOne = function(base, exp) {
  if (exp === 0) {
    return 1;
  }
  return recursionOne(base, exp - 1) * base;
}

// console.log(recursionOne(2, 5));

var recursionTwo = function(base, exp) {
  if (exp === 0) {
    return 1;
  }
  if (exp % 2 === 0) {
    return Math.pow(recursionTwo(base, exp / 2), 2)
  }
  else {
    return Math.pow(recursionTwo(base, (exp - 1) / 2), 2) * base
  }
}

// console.log(recursionTwo(2, 6));

//Fibs

var fibsRec      = function(n) {
  if (n === 1) { return [0]; }
  if (n === 2) { return [0, 1]; }

  var fibs       = fibsRec(n - 1);
  fibs.push(fibs[fibs.length - 1] + fibs[fibs.length - 2]);
  return fibs;
}

// console.log(fibsRec(5));

//Binary Search

var binsearch  = function(arr, target) {
  var midpoint = arr.length / 2;
  var leftArr  = arr.slice(0, midpoint);
  var rightArr = arr.slice(midpoint, arr.length);

  if (arr[midpoint] < target)
  {
    return midpoint + binsearch(rightArr, target);
  }

  else if (arr[midpoint] > target)
  {
    return binsearch(leftArr, target);
  }
  else
  {
    return midpoint;
  }
}

// console.log(binsearch([1,2,3,4,9,12,56,1235],3))


// Make Change

var makeChange = function (amt, array) {
  if (array.length === 1){
    var smallestCoins = [];
    for(var i=0;i<amt;i++){
       smallestCoins.push(array[0]);
    }
    return smallestCoins;
  }
  var maxCoin = array[0];
  if(amt < maxCoin)
  {
    array.shift();
    return makeChange(amt, array);
  }
  else
  {
    var a = makeChange(amt - maxCoin, array)
    a.push(maxCoin)
  return a;
  }
}



console.log(makeChange(62, [25,10,5,1]))












