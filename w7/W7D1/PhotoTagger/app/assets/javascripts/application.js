// This is a manifest file that'll be compiled into application.js,
// which will include all the files listed below.
//
// Any JavaScript/Coffee file within this directory,
// lib/assets/javascripts, vendor/assets/javascripts, or
// vendor/assets/javascripts of plugins, if any, can be referenced
// here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll
// appear at the bottom of the the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE
// PROCESSED, ANY BLANK LINE SHOULD GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.serializeJSON
//= require underscore
//
//= require_tree ./models
//= require_tree ./views
//= require_tree ../templates
//
//= require_tree .


(function(root){

  var PT = root.PT = (root.PT || {})

  _.extend(PT, {
    initialize: function() {
      PT.showPhotosIndex();
    },

    showPhotosIndex: function() {
      PT.Photo.fetchByUserId(window.CURRENT_USER_ID, function(photos){
        var photoView = new PT.PhotosListView(photos);
        var photoForm = new PT.PhotoFormView();
        $('div#content').append(photoView.render().$el);
        $('div#content').append(photoForm.render().$el);
      });
    },

    showPhotoDetail: function(photo){
      var photoDetail = new PT.PhotoDetailView(photo);
      $('div#content').append(photoDetail.render().$el);
    }
  })

})(this)


