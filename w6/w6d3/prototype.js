Function.prototype.inherits = function (SuperClass) {
  function Surrogate() {};
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
}

// function MovingObject(name) {
//   this.name = name;
// };
// MovingObject.prototype.roll = function() {
//   console.log("We're rolling");
// }
//
// function Ship () {};
// Ship.inherits(MovingObject);
//
// function Asteroid () {};
// Asteroid.inherits(MovingObject);
// Asteroid.prototype.getHair = function(length) {
//   console.log("This is an asteroid with hair of length " + length);
// }
//
// new_asteroid = new Asteroid();
// new_ship = new Ship();

// console.log(new_asteroid.getHair(23));
// console.log(new_ship.getHair(12));
// console.log(new_asteroid.prototype instanceof MovingObject);

// new_asteroid.roll();

// new_moving_object = new MovingObject();
// new_moving_object.getHair(0);