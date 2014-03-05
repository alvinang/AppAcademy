var readline = require('readline');
var READER = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

(function (root) {
  var Hanoi = root.Hanoi = (root.Hanoi || {});
  var Game = Hanoi.Game = function(num){
    this.board = this.createBoard(num);
    this.num = num;
  }

  Game.prototype.createBoard = function(num) {
    var board = []
    for (var j = 0; j < 3; j++){
      board[j] = [];
      for (var i = 1; i <= num; i++){
        if (j === 0){
          board[j].push(i);
         }
       }
     }
    return board;
  }

  Game.prototype.checkWon = function(){
    console.log(this.board[this.board.length - 1]);

    if (this.board[2].length === this.num){
      return true;
    } else {
      return false;
    }
  }
  // move discs from before to after
  Game.prototype.move = function(from, to){

    if (this.validMove(from, to)){
      this.board[to].unshift(this.board[from].shift());
    } else {
      console.log("Invalid move!!");
    }
    this.userInput();
  }
  // need user input
  Game.prototype.userInput = function(){
    var that = this;

    console.log(that.board)
    if (that.checkWon() === false) {
      READER.question("Move from?", function(from) {
        READER.question("Move to?", function(to){
          that.move(from,to)
        });
      });
    } else {
      console.log("You might have won....");
      READER.close();
      return;
    }
  }
  // check valid move?
  Game.prototype.validMove = function(from, to){
    if (this.board[from].length === 0){
      return false;
    } else if (this.board[to].length === 0) {
      return true;
    }
    else if (this.board[from][0] < this.board[to][0]) {
      return true;
    }
    return false;
  }

  Game.prototype.play = function(){
    console.log("welcome to towers of hanoi");
    this.userInput();
  }
})(this)

var hanoi = new this.Hanoi.Game(3);
console.log(hanoi.board);
hanoi.play();