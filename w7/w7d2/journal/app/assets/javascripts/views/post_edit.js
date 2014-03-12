Journal.Views.PostEdit = Backbone.View.extend({

  events: {
    "submit .edit-post": "editPost"
  },

  template: JST['posts/edit'],

  render: function() {
    var renderedContent = this.template({
      post: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  editPost: function(event) {
    var that = this;

    event.preventDefault();
    var updates = $(event.target).serializeJSON();
    if (this.model.isNew()) {
      var newPost = this.model.save(updates, {
        url: 'api/posts',
        success: function(savedModel) {
          that.collection.add(savedModel);
          Backbone.history.navigate("#/posts/" + that.model.id, { trigger: true })
        }
      })
    } else {
      this.model.save(updates, {
        success: function() {
          Backbone.history.navigate("#/posts/" + that.model.id, { trigger: true })
        },
        error: function() {
          alert("dude..seriously..");
        }
      })
    }
  }

});