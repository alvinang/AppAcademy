window.Trellino.Views.ListNew = Backbone.View.extend({
  
  initialize: function(options) {
    this.list = options.list;
  },
  
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
    list.board_id = this.model.id;
    list.rank = 1;
    
    this.model.lists().create(list, {
      success: function(list) {
      },
      error: function (list) {
        alert('list not added');
      }
    })    
  }
}); 