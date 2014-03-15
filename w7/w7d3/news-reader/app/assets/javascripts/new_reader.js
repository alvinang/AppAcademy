window.NewReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $rootEl = $('#container');

    new NewReader.Routers.AppRouter({
      $rootEl: $rootEl
    });

    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewReader.feeds = new NewReader.Collections.Feeds();

  NewReader.feeds.fetch({
    success: function() {
      NewReader.initialize();
    },
    error: function() {
      alert("RSS not available!");
    }
  })
});
