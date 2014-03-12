Journal.Views.PostShow = Backbone.View.extend ({

  initialize: function() {
    var $elements;
  },

  events:{
    "dblclick .post": "editElement",
    "blur .post": "saveElement"
  },

  template: JST["posts/show"],

  render: function() {
    var renderedContent = this.template({ post: this.model });
    this.$el.html(renderedContent);
    return this;
  },

  editElement: function(event) {
    $elements = $(event.target);
    $(event.target).html("<input type='text' data-post='"
      + $(event.target).data('post')
      + "' value='"
      + $(event.target).html()
      + "'>"
    );

  },

  saveElement: function(event) {
    var $updated = $(event.target);
    var modelEl = $updated.data('post');
    this.model.set(modelEl, $updated.val());
    this.model.save({}, {
      success: function () {

        $elements.html($updated.val());
        $updated.parent().html($elements);
        return this;
      }
    });
  }
});