window.Trellino.Views.CardShow = Backbone.CompositeView.extend({
  tagName: 'ul',
  template: JST['cards/show'],
  
  initialize: function(id) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.lists(), "add", this.addList);
    this.listenTo(this.model.lists(), "remove", this.removeList);
    
    this.model.lists().each(this.addList.bind(this));
    
    var listNewView = new Trellino.Views.CardNew({
      list: this.model
    });
    
    this.addSubview(".list-new", listNewView)    
  },
  
  addCard: function(list) {
    var listShowView = this.template({
      list: list 
    });
    
    this.addSubviews(".list-item", listShowView);
    listShowView.render();
  },
  
  removeCard: function(list) {
    var listShowView = 
      _(this.subviews()[".list-item"]).find(function(subview){
        return subview.model == list
      });
      
    this.removeSubview(".list-item", list);  
  },

  render: function() {
    var renderedContent = this.template({
      cards: this.model.cards()
    });
        
    this.$el.html(renderedContent);
    this.renderSubviews();
    
    return this;
  }
  
});