window.Todo.Views.TodosNew = Backbone.View.extend({
  template: JST['todos/new'],
  
  events: {
    "submit form": "submit"
  },
  
  render: function() {
    var renderedContent = this.template();    
    this.$el.html(renderedContent);
    
    return this;
  },
  
  submit: function (event) {
    event.preventDefault();
    
    var params = $(event.currentTarget).serializeJSON()["todo"];    
    var newTodo = new Todo.Models.Todo(params);
    newTodo.save({}, {
      success: function () {
        Todo.Collections.todos.add(newTodo);
        Backbone.history.navigate("", { trigger: true });
      }
    })
    
    // newTodo.set('title', $('#todo_title').val());
    // can use $('#todo_title).val() on top or in {} in save
  }
  
});