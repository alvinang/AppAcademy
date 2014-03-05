var Piece = require("./piece.js").Piece;

_makeGrid = function(){
  var grid = [];
  for (var i = 0; i < 8; i++) {
    var row = new Array(8);
    grid.push(row);
  }
  
  grid[3][3] = new Piece("white");
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[4][4] = new Piece("white");
  return grid; 
}

function Board() {
  this.grid = _makeGrid();
}

Board.prototype.full = function () {
  var pieces = [];
  for (var i = 0; i < 8; i++) {
    for (var j = 0; j < 8; j++) {
      var piece = this.grid[i][j];
      if (piece) {
        pieces.push(piece);
      }
    }
  }
  
  return (pieces.length === 64);
};

// print board



exports.Board = Board;
