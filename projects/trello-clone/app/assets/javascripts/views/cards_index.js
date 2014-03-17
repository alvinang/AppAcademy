window.Trellino.Views.CardsIndex = Backbone.View.extend({
  
  template: JST['cards/index'],
  
  render: function () {
    var renderedContent = this.template({
      cards: this.collection,
      list: this.model
    });
    
    this.$el.html(renderedContent);
    return this;
  }
  
})