(function(root){

  var Snakes = root.Snakes = (root.Snakes || {});

  var View = Snakes.View = function (board, el){
    this.board = board;
    this.$el = el;
  }

  View.prototype.start = function(){
    var that = this;
    $(this.$el).on('keydown', this.handleKeyEvent);
    setInterval(that.step(), 500);
  }

  View.prototype.handleKeyEvent = function(event){
    switch(event){
     case 38: this.snake.turn("N"); break;
     case 40: this.snake.turn("S"); break;
     case 37: this.snake.turn("W"); break;
     case 39: this.snake.turn("E"); break;
   }
  }

  View.prototype.step = function() {
    var that = this;
    this.board.snake.move();


      console.log(that.board.render());
      $('pre').text("....\n....\n....");

  }


})(this);