window.Todo = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},
  
  initialize: function() {
    // just sets up the routes
    new Todo.Routers.AppRouter();
    
    // start listening to changes to the location
    Backbone.history.start();
  }
};

$(Todo.initialize);