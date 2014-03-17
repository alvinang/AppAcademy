window.Trellino.Views.BoardNew = Backbone.CompositeView.extend({
  template: JST['boards/new'],
  
  events: {
    "submit #new-board": "addBoard"
  },
  
  render: function() {
    var renderedContent = this.template({
      board: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },
  
  addBoard: function(event) {
    event.preventDefault();
    var board = $('#new-board').serializeJSON().board;
    this.model.save(board, {
      success: function(board) {
        Trellino.boards.add(board);
        Backbone.history.navigate("#/boards/" + board.id, {trigger: true})
      }, 
      error: function() {        
        alert(board.id + "board not saved")
      }
    });
        
  }     
  
});