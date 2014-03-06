(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});

  function MovingObject(pos, vel, radius, color) {
    this.pos = pos;
    this.centerX = pos[0];
    this.centerY = pos[1];
    this.vel = vel;
    this.radius = radius;
    this.color = color;
    this.x_dir = vel[0]; // Math.round(Math.random()) * 2 - 1;
    this.y_dir = vel[1]; //Math.round(Math.random()) * 2 - 1;

  }

  MovingObject.prototype.move = function() {
    this.pos[0] += this.vel[0] * this.x_dir;
    this.pos[1] += this.vel[1] * this.y_dir;
    this.centerX = this.pos[0];
    this.centerY = this.pos[1];
    // console.log(this.pos);
    return this.pos;
  }

  MovingObject.prototype.draw = function (ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();

    // console.log(this.centerX, this.centerY, this.radius, this.pos)

    ctx.arc(
      this.centerX,
      this.centerY,
      this.radius,
      0,
      2 * Math.PI,
      false
    );

    ctx.fill();
  };

  MovingObject.prototype.isCollidedWith = function(otherObject) {
    var x_difference = this.centerX - otherObject.centerX;
    var y_difference = this.centerY - otherObject.centerY;
    var distance = Math.sqrt(Math.pow(x_difference, 2) + Math.pow(y_difference, 2));

    var radii = this.radius + otherObject.radius;

    return (radii > distance);
  }

  Asteroids.MovingObject = MovingObject;
})(this)

