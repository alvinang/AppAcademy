window.Trellino.Collections.Lists = Backbone.Collection.extend({  
  initialize: function (models, options) {
    this.board = options.board;
  },
  
  model: Trellino.Models.List,
    
  url: function() {
    return this.board.url() + "/lists";
  }
  
});