(function(root){

  var PT = root.PT = (root.PT || {});

  var PhotoDetailView = PT.PhotoDetailView = function(photo) {
    this.$el = $('<div>');
    this.template = JST["photo_detail"];
    this.photo = photo;

  }

  _.extend(PhotoDetailView.prototype, {

    render: function() {
      var content = this.template();
      this.$el.html(content);
      return this;
    }
  })

})(this);