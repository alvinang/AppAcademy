Journal.Routers.Posts = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.$sidebarEl = options.$sidebarEl;
  },

  routes: {
    "": "index",
    "posts/new": "new",
    "posts/:id": "show",
    "posts/:id/edit": "edit"
  },

  index: function() {
    // Journal.posts.fetch();
    this.indexView = new Journal.Views.PostsIndex({
      collection: Journal.posts
    });
    this.$rootEl.html(this.indexView.render().$el);
  },

  show: function(id) {
    this.showView = new Journal.Views.PostShow({
      model: Journal.posts.get(id)
    });
    this.$rootEl.html(this.showView.render().$el);
  },

  edit: function(id) {
    this.editView = new Journal.Views.PostEdit({
      model: Journal.posts.get(id)
    });
    this.$rootEl.html(this.editView.render().$el);
  },

  new: function() {
    this.editView = new Journal.Views.PostEdit({
      model: new Journal.Models.Post,
      collection: Journal.posts
    });

    this.$rootEl.html(this.editView.render().$el);
  }

});