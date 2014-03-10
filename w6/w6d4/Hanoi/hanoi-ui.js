(function (root) {

  var Hanoi = root.Hanoi = (root.Hanoi || {});

  var UI = Hanoi.UI = function UI (game) {
    this.game = game;
  }

  // click handler - addclass and remove class
  UI.prototype.listener = function() {
    var that = this;
    this.from_tower = null;

    $('.tower').on('click', function() {
      var position = $(this).data('pos');

      if (that.from_tower === null) {
        that.from_tower = position;
        return;
      }

      if (that.move(that.from_tower, position)) {
        if(that.won())
          alert("You Won!");
      } else {
        alert('illegal move: try again');
      }

      that.from_tower = null;
    });
  }

  UI.prototype.move = function(from_tower, to_tower){
    var movement = this.game.move(from_tower, to_tower);

    if (movement) {
      var $fromTower = $('div.tower[data-pos=' + from_tower +']');
      var $toTower = $('div.tower[data-pos=' + to_tower +']');
      var $disc = $fromTower.children().last();
      $disc.remove();
      $toTower.append($disc);
    }

    return movement;
  }
  
  UI.prototype.won = function(){
    return this.game.isWon();
  }

})(this)