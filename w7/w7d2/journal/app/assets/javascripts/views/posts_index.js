Journal.Views.PostsIndex = Backbone.View.extend ({

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "remove add change:title reset", this.render);
  },

  template: JST["posts/index"],

  render: function() {
    var renderedContent = this.template({ posts: this.collection });
    this.$el.html(renderedContent);
    return this;
  },

  events: {
    "click .delete-post": "deletePost"
  },

  deletePost: function(event) {
    var that = this;
    event.preventDefault();
    
    var postId = $(event.target).parent().parent().data('id');
    var post = this.collection.get(postId)
    this.collection.remove(post);

    post.destroy({
      url: "/api/posts/"+ postId,
      success: function() {
        that.render();
      }
    });
  }
})