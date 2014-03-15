window.Trellino.Collections.Boards = Backbone.Collection.extend({
  url: '/boards',
  model: Trellino.Models.Board,
  
  getOrFetch: function(id) {
    var model;
    var boards = this;
    
    if (model = this.get(id)) {
      model.fetch();
      return model;
    } else {
      model = new boards.model({ id: id });
      model.fetch({
        success: function() { boards.add(model) }
      });
      
      return model;
    }    
  }  
});