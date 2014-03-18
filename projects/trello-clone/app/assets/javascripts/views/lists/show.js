window.Trellino.Views.ListShow = Backbone.CompositeView.extend({
  template: JST['lists/show'],
  
  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.cards(), "add", this.addCard);
    this.listenTo(this.model.cards(), "remove", this.removeCard);
    
    this.model.cards().each(this.addCard.bind(this));
    
    var cardNewView = new Trellino.Views.CardNew({
      list: this.model
    });
    
    this.addSubview("#cards-new", cardNewView);
  },
  
  addCard: function(card) {
    var cardShowView = new Trellino.Views.CardShow({
      model: card
    });
    
    this.addSubview(".cards", cardShowView)
    cardShowView.render();
  },
  
  removeCard: function(card) {
    var cardShowView = 
      _(this.subviews()['.cards']).find(function (subview) {
        return subview.model == comment;
      });
    
    this.removeSubview(".cards", cardShowView);
  },
  
  render: function() {
    var renderedContent = this.template({
      board: this.model
    });
    
    this.$el.html(renderedContent);
    this.renderSubviews();
    
    return this;
  }
  
});