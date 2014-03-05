Function.prototype.myBind = function(obj) {
  var that = this;
  // console.log(obj, this, that.apply(obj));

  return function() {
    return that.apply(obj, arguments);
  }
}

this.x = 9;
var module = {
  x: 81,
  getX: function(a) { return this.x + a; }
};

module.getX(); // 81

var getX = module.getX;
// console.log(getX()); // 9, because in this case, "this" refers to the global object

// create a new function with 'this' bound to module
var boundGetX = getX.myBind(module);
console.log(boundGetX(10)); // 81