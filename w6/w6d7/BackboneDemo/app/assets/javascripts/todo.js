window.Todo = {
  Models: {},
  Collections: {},
  Views: {},
  
  initialize: function() {
    var indexView = new Todo.Views.TodosIndex({
      collection: Todo.Collections.todos,
      className: 'parent-for-ul'
    });
    
    Todo.Collections.todos.fetch({});
    $('body').append(indexView.render().$el)
    
    var newView = new Todo.Views.TodosNew();
    $('body').append(newView.render().$el);
  }
};

$(Todo.initialize);