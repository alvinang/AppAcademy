window.Trellino.Views.BoardShow = Backbone.View.extend({
  template: JST['boards/show'],
  
  initialize: function(id) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.lists(), "add", this.render);
    // this.listenTo(this.model.lists(), "add", this.render);
  },

  render: function() {
    debugger
    var renderedContent = this.template({
      board: this.model
    });
        
    this.$el.html(renderedContent);
    return this;
  }
  
});