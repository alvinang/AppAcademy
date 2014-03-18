window.Trellino.Views.CardNew = Backbone.View.extend({
  template: JST['cards/new'],
  
  events: {
    "submit #add-new-card": 'addCard'
  },
  
  render: function () {
    var renderedContent = this.template({
      card: new Trellino.Models.Card()
    });
    
    this.$el.html(renderedContent);
    return this;
  },
  
  addCard: function(event) {
    
    var that = this;
    event.preventDefault();
    var card = $(event.target).serializeJSON().card;
    card.list_id = this.model.id
    card.rank = 1;    
    debugger
    // 
    // var newCard = new Trellino.Models.Card {(
    //   
    // )}
    
    this.model.create(card, { 
      success: function(newCard) {
        
      },
      error: function() {
        alert("Card was not created");
      }
    });
  }
  
});