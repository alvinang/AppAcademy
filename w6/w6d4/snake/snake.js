(function(root){
  var Snakes = root.Snakes = (root.Snakes || {});

  var Snake = Snakes.Snake = function(){
    //["N","E","S","W"]
    this.dir = "N";
    this.segments = [];

  }

  var Coord = Snakes.Coord = function(){
  }

  Coord.prototype.plus = function(dir,distance){
    switch(dir){
    case "N":
      this[1]+=1;
      break;
    case "W":
      this[0]-=1;
      break;
    case "E":
      this[0]+=1;
      break;
    case "S":
      this[1]-=1;
      break;
    }
  }

  Snake.prototype.move = function(){
    var snake = this
    this.segments.forEach(function(seg){
      seg.plus(snake.dir);
    });
  }

  Snake.prototype.turn = function(nDir){
    this.dir = nDir
  }


})(this);