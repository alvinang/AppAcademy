window.Trellino.Views.BoardShow = Backbone.CompositeView.extend({
  template: JST['boards/show'],
  
  initialize: function(id) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.lists(), "add", this.addList);
    
    var listNewView = new Trellino.Views.ListNew({
      list: this.model
    });
    
    this.addSubview("div.list-all", listNewView)    
  },
  
  addList: function(list) {
    var listShowView = this.template({
      list: list 
    });
    
    this.subviews("ul.list-item", listShowView);
  },

  render: function() {
    debugger
    var renderedContent = this.template({
      board: this.model
    });
        
    this.$el.html(renderedContent);
    this.renderSubviews();
    return this;
  }
  
});