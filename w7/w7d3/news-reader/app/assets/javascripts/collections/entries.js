window.NewReader.Collections.Entries = Backbone.Collection.extend({
  model: NewReader.Models.Entry,

  url: function () {
    return this.feed.url() + "/entries";
  },

  initialize: function(models, options) {
    this.feed = options.feed;
  }

});