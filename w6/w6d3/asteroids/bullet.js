(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});

  Function.prototype.inherits = function (SuperClass) {
    function Surrogate() {};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
  }

  function Bullet(pos, vel) {
    COLOR = "blue";
    RADIUS = Math.random() * 20 + 5;
    var speed = Math.sqrt();

    Asteroids.MovingObject.call(this, pos, vel, RADIUS, COLOR);
  };

  Bullet.inherits(Asteroids.MovingObject);

  Asteroids.Bullet = Bullet;
})(this)