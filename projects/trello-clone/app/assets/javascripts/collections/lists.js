window.Trellino.Collections.Lists = Backbone.Collection.extend({  
  initialize: function (models, opts) {
    this.board = opts.board;
  },
  
  model: Trellino.Models.List,
    
  url: function() {
    return this.board.url() + "/lists";
  }
  
});