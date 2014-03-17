window.Trellino.Views.BoardShow = Backbone.View.extend({  
  
  template: JST['boards/show'],  
  
  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(this.model.lists(), 'add', this.render);    
  },
  
  events: {
    'click button.new-list': 'addList',
    'click button.list-destroy': 'removeList',
    'click button.delete-board': 'removeBoard'    
  },
  
  render: function() {
    var renderedContent = this.template({
      board: this.model    
    });    
    
    this.$el.html(renderedContent);
    return this;
  },
  
  addList: function(event) {
    var newListView = new Trellino.Views.ListNew({
      model: this.model    
    });
    
    this.$el.find('#add-list').append(newListView.render().$el);
  },
  
  removeList: function(event) {
    event.preventDefault();
    var that = this;
    var listId = $(event.target).parent().data('list-id');
    var listModel = this.model.lists().get({ id: listId });
    listModel.destroy({
      success: function() {
        that.model.lists().remove({ id: listId })  
        that.render();        
      }, 
      error: function() {
        alert('Did not destroy');
      }
    })
  },
  
  removeBoard: function(event) {
    event.preventDefault();
    var that = this;
    
    var boardModel = Trellino.boards.get({id: this.model.id})
    boardModel.destroy({
      success: function() {
        Trellino.boards.remove({ id: that.model.id })
        that.render();
        Backbone.history.navigate("/", {trigger: true})        
      }
    })
  }  
});