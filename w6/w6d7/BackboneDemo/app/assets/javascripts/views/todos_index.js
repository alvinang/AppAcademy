window.Todo.Views.TodosIndex = Backbone.View.extend({
  template: JST["todos/index"],
  
  //only binds within an $el for this view
  events: {
    "click button.refresh": "refresh"
  },
  
  initialize: function (options) {
    this.listenTo(
      this.collection, 
      'sync add', // only fetch newly added event (add) 
      this.render //when install listener, backbone will bind this function
                  // to listener for you
    );
  },
  
  refresh: function () {
    this.collection.fetch();
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