window.Trellino = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $rootEl = $('#content');    
    
    new Trellino.Routers.AppRouter({
      $rootEl: $rootEl
    });

    Backbone.history.start();
  }
};

$(document).ready(function(){
  Trellino.boards = new Trellino.Collections.Boards();
  
  Trellino.boards.fetch({
    success: function() {      
      Trellino.initialize();
    },
    error: function() {
      alert("didn't work");
    }
  }); 
});