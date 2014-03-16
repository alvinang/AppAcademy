window.Trellino.Views.ListNew = Backbone.View.extend({
  template: JST['lists/new'],
  
  render: function() {
    var renderedContent = this.template({
      list: this.list
    });
    
    this.$el.html(renderedContent);
    return this;
  }
});