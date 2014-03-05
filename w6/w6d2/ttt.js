var readline = require('readline');
var READER = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

(function (root) {
  var TicTacToe = root.TicTacToe = (root.TicTacToe || {});
  var Game = TicTacToe.Game = function(){
    this.board = this.createBoard();
  }

  Game.prototype.createBoard = function(){
    var board = [[],[],[]];
    return board;
  }

  // won?
  Game.prototype.win = function(){
    if (this.checker){
      return true;
    }
    return false;
  }

  Game.prototype.checker = function(){
    for(var i = 0; i < 3; i++){
      if(this.board[i][0] === this.board[i][1] === this.board[i][2]){
        return true;
      } else if (this.board[0][0] === this.board[1][1] === this.board[2][2]){
        return true;
      } else if (this.board[0][2] === this.board[1][1] === this.board[2][0]){
        return true;
      }
      return false;
    }
  }

  // askUser method
  Game.prototype.askUser = function(){
    var that = this;

    READER.question("Place your mark z.? (x, y) ", function(mark){
      this.placeMark(parseInt(mark[0]), parseInt(mark[2]));
      if (that.win){
        console.log("You might have won..");
        return;
      } else{
        that.placeMark(parseInt(mark[0]), parseInt(mark[2]));
      }
    })
  }

  // placemark on board
  Game.prototype.placeMark = function(x, y) {
    if (this.validMove(x, y)){
      this.board[y][x] = 'x';
    } else {
      console.log("Invalid move dude..");
      this.askUser();
    }
  }

  // check valid?
  Game.prototype.validMove = function(x, y){
    if (x < 3 && y < 3 && x >= 0 && y >= 0){
      if (this.board[y][x] === null) {
        return true;
      }

      return false;
    }
  }

  Game.prototype.play = function(){
    console.log("Welcome to TTT MZ");
    this.askUser();
  }

})(this);

var ttt = new this.TicTacToe.Game;
ttt.play();