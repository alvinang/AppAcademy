window.Trellino.Views.ListShow = Backbone.View.extend({
  template: JST['lists/show'],
  
  render: function() {
    var renderedContent = this.template({
      list: this.list
    });
    
    this.$el.html(renderedContent);
    return this;
  }
  
});