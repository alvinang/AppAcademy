window.Todo.Collections.Todos = Backbone.Collection.extend({
  url: 'api/todos',
  model: Todo.Models.Todo
});

// Convenience to use Todo.Collections.todos instead of Todos
window.Todo.Collections.todos = new Todo.Collections.Todos();

// Create
// Show
// Update
// Destroy
// Index

// = Form pages - don't need it cuz we have an API, new and edit is not needed
// in an API
// New
// Edit