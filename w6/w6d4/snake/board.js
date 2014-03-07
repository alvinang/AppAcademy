(function(root){

  var Snakes = root.Snakes = (root.Snakes || {});

  var Board = Snakes.Board = function() {
    this.snake = new Snakes.Snake();
    this.board = this.makeBoard();
  }

  Board.prototype.render = function() {
    return this.board;
  }

  Board.prototype.makeBoard = function () {
    return _.times(10, function (i) {
      return _.times(10, function (j) {
        return ".";
      });
    });
  };

})(this);
