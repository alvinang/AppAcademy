(function (root) {
  var Asteroids = root.Asteroids = (root.Asteroids || {});

  function Game(ctx) {
    this.ctx = ctx.getContext("2d");
    this.asteroids = [];

    DIM_X = 520;
    DIM_Y = 520;
    FPS = 30;

    this.ship = new Asteroids.Ship();
  };

  Game.prototype.addAsteroids = function(numAsteroids) {
    for (var i = 0; i < numAsteroids; i++) {
      var newAsteroid = Asteroids.Asteroid.randomAsteroid(DIM_X, DIM_Y);
      this.asteroids.push(newAsteroid);
    }
  }

  Game.prototype.draw = function() {
    var that = this;

    that.ctx.clearRect(0, 0, DIM_X, DIM_Y);

    that.asteroids.forEach(function (asteroid) {
      asteroid.draw(that.ctx);
    });

    that.ship.draw(that.ctx);
  }

  Game.prototype.move = function() {
    this.asteroids.forEach(function (asteroid) {
      asteroid.move();
    })

    this.ship.power(0);
    this.ship.move();
  }

  Game.prototype.step = function() {
    this.checkCollisions();
    this.removeAsteroids();
    this.move();
    this.draw();
  }

  Game.prototype.start = function() {
    var that = this;
    that.addAsteroids(1);
    that.play = window.setInterval(that.step.bind(that), FPS);
  }

  Game.prototype.checkCollisions = function() {
    var that = this;
    that.asteroids.forEach(function (asteroid) {
      if (that.ship.isCollidedWith(asteroid)) {
        that.stop.bind(that);
        alert("you lose");
      }
    });
  }

  Game.prototype.removeAsteroids = function() {
    var that = this;

    that.asteroids.forEach(function(asteroid) {
      if (asteroid.pos[0] > DIM_X
        || asteroid.pos[1] > DIM_Y
        || asteroid.pos[0] < 0
        || asteroid.pos[1] < 0) {
        var index = that.asteroids.indexOf(asteroid);
        that.asteroids.splice(index, 1);
      }
    })
  }

  Game.prototype.stop = function() {
    window.clearInterval(this.play);
  }

  Asteroids.Game = Game;
})(this)

