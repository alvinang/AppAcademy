window.Trellino.Views.BoardsIndex = Backbone.View.extend({
  className: 'board',
  template: JST['boards/index'],
  
  events: {
    "click a.add-boards": "addBoard",
    
  },
  
  render: function() {
    var renderedContent = this.template({
      boards: this.collection
    });
    
    this.$el.html(renderedContent);
    return this;
  },
  
  addBoard: function(event) {
    event.preventDefault();
    $(event.currentTarget).html('<input type="text" placeholder="New Board Name">');
    return this;
  }
  
});