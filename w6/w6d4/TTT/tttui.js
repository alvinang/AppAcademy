(function (root) {

  var TTT = root.TTT = (root.TTT || {});

  var UI = TTT.UI = function (game, el) {
    this.game = game;
    this.el = el;
  }

  // listen to an event
  UI.prototype.listener = function (){
    var that = this;

    $(document).ready(function() {
      $('.container div').on("click", function (event) {
        var $value = $(this)

        if(that.move($value.data('pos'))){
          $value.addClass(that.pickColor()).text(that.getMark());
        } else {
          alert('Illegal Move!');
        }
        if (that.game.winner()){
          $value.parent().append($('<iframe width="420" height="315" src="http://www.youtube.com/embed/DM9cJtwUUsw"
            frameborder="0" autoplay allowfullscreen></iframe>'));
        }
      });
    })
  }

  UI.prototype.getMark = function(){
    return this.game.player;
  }

  UI.prototype.checkWinner = function(){
    return this.game.winner();
  }

  UI.prototype.move = function(pos){
    return this.game.move(pos);
  }

  UI.prototype.play = function(){
    this.listener();
  }

  UI.prototype.pickColor = function(){
    if (this.getMark() === 'x'){
      return 'clickedX';
    } else { return 'clickedY';}
  }

})(this)