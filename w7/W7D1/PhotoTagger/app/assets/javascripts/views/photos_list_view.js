(function(root) {

  var PT = root.PT = (root.PT || {})

  var PhotosListView = PT.PhotosListView = function(options) {
    this.$el = $("<div>");
    this.photos = options;
    PT.Photo.on("add", this.render.bind(this));
    this.$el.on("click", "li", this.showDetail.bind(this));
  }

  _.extend(PhotosListView.prototype, {

    render: function() {
      var view = this;

      this.$el.empty();
      this.$el.append("<ul class='photos'>");
      this.photos.forEach(function(photo){
        var to_append = "<li data-id=\""
        + photo.get("id")
        + "\">"
        + "<a href=\"#\">"
        + photo.get("title")
        + "</a>"
        + "</li>";

        view.$el.find('.photos').append(to_append);
      })

      return this;
    },

    showDetail: function(event) {
      event.preventDefault();
      var data = $(event.currentTarget).data('id');

      var photo = PT.Photo.find(data);
      PT.showPhotoDetail(photo)

    }

  })

})(this)