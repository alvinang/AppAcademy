window.NewReader.Views.FeedsIndexView = Backbone.View.extend({
  tagName: 'ul',
  className: 'feed-index',

  template: JST['feeds/index'],

  render: function() {
    var renderedContent = this.template({
      feeds: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  }
});