window.Todo.Views.TodosIndex = Backbone.View.extend({
  template: JST["todos/index"],
  
  //only binds within an $el for this view
  events: {
    "click button.refresh": "refresh"
  },
  
  refresh: function () {
    var view = this;
    
    this.collection.fetch({
      success: function () { view.render(); }
    });
  },
  
  // not needed if we use collection in todo.js root file
  // allowing us to pass in different collections
  // initialize: function (options){
  //   this.collection = options.collection;
  // },
  
  render: function () {
    var renderedContent = this.template ({
      todos: this.collection
    })
    
    this.$el.html(renderedContent);
    
    return this;
  }
});