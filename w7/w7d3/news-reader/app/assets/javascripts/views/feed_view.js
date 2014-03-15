window.NewReader.Views.FeedView = Backbone.View.extend({
  className: 'feed-view',

  template: JST['feeds/show'],

  events: {
    "click button.refresh" : "refresh"
  },

  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  refresh: function(e){
    e.preventDefault();
    var that = this;
    this.model.fetch();
  },

  render: function() {
    var renderedContent = this.template({
      feed: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }
});