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
    var board = $(event.currentTarget).children().val();
    this.model.save({title: board}, {
      success: function(board) {
        Backbone.history.navigate("/boards/" + board.id, {trigger: true})
      }, 
      error: function() {        
        alert(board.id + "board not saved")
      }
    });
        
  }     
  
});