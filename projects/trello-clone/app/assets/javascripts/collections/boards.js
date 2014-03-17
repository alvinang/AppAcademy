window.Trellino.Collections.Boards = Backbone.Collection.extend({
  url: '/boards',
  model: Trellino.Models.Board,
  
  getOrFetch: function(id) {
    var model;
    
    if (model = this.get(id)) {
      model.fetch();
      return model;
    } else {
      model = new this.model({ id: id });

      var boards = this;
      model.fetch({
        success: function() { boards.add(model) }
      });
      
      return model;
    }    
  }  
});