window.Trellino.Views.BoardShow = Backbone.View.extend({  
  
  template: JST['boards/show'],  
  
  initialize: function() {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model, 'change', this.render);
    this.listenTo(Trellino.boards, 'add', this.render);
  },
  
  events: {
    'click button.new-list': 'addList'
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
      model: this.model,
      collection: Trellino.boards
    });
    
    this.$el.find('#add-list').append(newListView.render().$el);
  },
  
  
  
});