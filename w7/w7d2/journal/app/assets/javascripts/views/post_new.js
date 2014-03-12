// Journal.Views.PostNew = Backbone.View.extend({
//
//   initialize: function() {
//     this.listenTo(this.collection, "add", this.render);
//   },
//
//   events: {
//     "submit .new-post": "newPost"
//   },
//
//   template: JST["posts/new"],
//
//   render: function() {
//     var renderedContent = this.template({
//       post: this.model,
//       collection: this.collection
//     });
//
//     this.$el.html(renderedContent);
//     return this;
//   },
//
//   newPost: function(event) {
//     event.preventDefault();
//     var newPost = $(event.target).serializeJSON();
//     if (newPost.isNew()) {
//
//     }
//   }
//
//
// });