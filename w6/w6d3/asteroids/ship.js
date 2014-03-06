(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});

  Function.prototype.inherits = function (SuperClass) {
    function Surrogate() {};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
  }

  function Ship() {
    COLOR = "pink";
    RADIUS = 13;

    this.pos = [250,250];
    this.centerX = this.pos[0];
    this.centerY = this.pos[1];
    this.vel = [0,0];
    this.radius = RADIUS;
    this.color = COLOR;
    this.x_dir = this.vel[0]; // 0;
    this.y_dir = this.vel[1]; // 0;

    // console.log(this, this.pos, this.vel, this.radius, this.color);

    Asteroids.MovingObject.call(this, this.pos, this.vel, this.radius, this.color);
  };

  Ship.inherits(Asteroids.MovingObject);

  Ship.prototype.draw = function(ctx) {

    this.pos[0] += this.vel[0] * this.x_dir;
    this.pos[1] += this.vel[1] * this.y_dir;
    this.centerX = this.pos[0];
    this.centerY = this.pos[1];

    ctx.fillStyle = '#ccddff';
    ctx.beginPath();
    ctx.moveTo(this.pos[0], this.pos[1] - 25);
    ctx.lineTo(this.pos[0] + 20, this.pos[1] + 25);
    ctx.lineTo(this.pos[0] - 20, this.pos[1] + 25);
    ctx.closePath();
    ctx.fill();
    ctx.strokeStyle = 'rgb(0,128,0)';
    ctx.lineWidth = 5;
    ctx.stroke();
  }

  Ship.prototype.power = function(impulse) {
    var that = this;

    key('up', function(){ that.vel[1] += 0.0005 });
    key('left', function(){ that.vel[0] = 1 });
    key('right', function(){ that.vel[0] = 1 });
    key('down', function(){ that.vel[1] -= 0.0005 });

    // this.vel += impulse;
  }

  Ship.prototype.fireBullet = function() {
    var bullet = new Bullet(this.pos, this.vel);

  }

  Asteroids.Ship = Ship;
})(this)