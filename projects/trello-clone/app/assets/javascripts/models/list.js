window.Trellino.Models.List = Backbone.Model.extend({
  
  toJSON: function() {
    var json = Backbone.Model.prototype.toJSON.call(this);
    
    delete json.id;
    return json;
  }
});