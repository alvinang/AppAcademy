window.Trellino.Views.ListNew = Backbone.View.extend({
  template: JST['lists/new'],
  
  events: {
    'click input[type="submit"]': 'addList'
  },
  
  render: function() {
    var renderedContent = this.template({
      list: new Trellino.Models.List()
    });
    
    this.$el.html(renderedContent);
    return this;
  },
  
  addList: function(event) {
    event.preventDefault();
    var that = this;
    var list = $('#add-new-list').serializeJSON().list;
    this.model.save(list, {
      success: function(list) {
        that.collection.add(list);
      },
      error: function (list) {
        alert('list not added');
      }
    })
    
  }
}); 