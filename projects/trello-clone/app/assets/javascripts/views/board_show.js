window.Trellino.Views.BoardShow = Backbone.View.extend({
  template: JST['boards/show'],
  
  initialize: function(id) {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    
    var renderedContent = this.template({
      board: this.model
    });
        
    this.$el.html(renderedContent);
    return this;
  }
  
});