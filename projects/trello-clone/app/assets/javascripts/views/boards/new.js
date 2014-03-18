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
    debugger
    event.preventDefault();
    var board = $('#new-board').serializeJSON().board;
    
    this.model.save(board, {
      success: function(savedBoard) {
        Trellino.boards.add(savedBoard);
        Backbone.history.navigate("#/boards/" + savedBoard.id, {trigger: true})
      }, 
      error: function() {        
        alert(board.id + "board not saved")
      }
    });
        
  }     
  
});