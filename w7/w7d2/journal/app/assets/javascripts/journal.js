window.Journal = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $rootEl = $('#content');
    var $sidebarEl = $('#side-bar');
    new Journal.Routers.Posts({
      $rootEl: $rootEl
    });
    this.indexView = new Journal.Views.PostsIndex({
      collection: Journal.posts
    });
    $sidebarEl.html(this.indexView.render().$el);
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Journal.posts = new Journal.Collections.Posts();
  Journal.posts.fetch({
    success: function(){
      Journal.initialize();
    }
  });
});
