(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});

  Function.prototype.inherits = function (SuperClass) {
    function Surrogate() {};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
  }

  function Asteroid(pos, vel) {
    COLOR = "black";
    RADIUS = Math.random() * 20 + 5;

    Asteroids.MovingObject.call(this, pos, vel, RADIUS, COLOR);
  };

  Asteroid.inherits(Asteroids.MovingObject);

  Asteroid.randomAsteroid = function(dimX, dimY) {
    var startX = Math.random() * dimX;
    var startY = Math.random() * dimY;

    var randomVec = function() {
      var maxVelocity = 5;
      var vel_x = Math.random() * maxVelocity;
      var vel_y = Math.random() * maxVelocity;
      return [vel_x, vel_y];
    }

    var velocity = randomVec();

    return new Asteroid([startX, startY], velocity);
  }

  Asteroids.Asteroid = Asteroid;
})(this)