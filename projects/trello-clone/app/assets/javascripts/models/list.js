window.Trellino.Models.List = Backbone.Model.extend({
  
  toJSON: function() {
    var json = Backbone.Model.prototype.toJSON.call(this);
    
    delete json.id;
    return json;
  },
  
  cards: function() {
    if (!this._cards) {
      this._cards = new Trellino.Collections.Cards([], {
        list: this
      });         
    }
     
    return this._cards;  
  },
  
  parse: function(jsonResp) {
    if (jsonResp.cards) {
      this.cards().set(jsonResp.cards);
      delete jsonResp.cards;
    }
    
    return jsonResp;
  }
  
});