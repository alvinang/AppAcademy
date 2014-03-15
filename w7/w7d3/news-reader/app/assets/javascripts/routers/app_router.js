window.NewReader.Routers.AppRouter = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "" : "index",
    "feeds/:id" : "feedShow",
  },

  index: function() {
    var indexView = new NewReader.Views.FeedsIndexView({
      collection: NewReader.feeds
    });

    this._swapView(indexView);
  },

  feedShow: function(id) {
    var showView = new NewReader.Views.FeedView({
      model: NewReader.feeds.getOrFetch(id)
    });

    this._swapView(showView);
  },


  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});

