(function(root){

  var PT = root.PT = (root.PT || {})

  var Photo = PT.Photo = function(options) {
    this.attributes = _.extend({}, options);
  }

  _.extend(Photo, {
    all: [],
    _events: {},

    fetchByUserId: function(userId, callback) {

      $.ajax({
        url: "api/users/" + userId + "/photos",
        type: "GET",
        success: function(photos) {
          photos.forEach(function(photo) {
            Photo.all.push(new Photo(photo));
          })
          callback(Photo.all);
        }
      })
    },

    on: function(eventName, callback) {
      if(!Photo._events[eventName]) {
        Photo._events[eventName] = [];
      }

      Photo._events[eventName].push(callback);
    },

    trigger: function(eventName) {
      var args = arguments;
      Photo._events[eventName].forEach(function(callback) {
        console.log(callback)
        callback(args[1]);
      })
    },

    find: function(photoId){
      var foundPhoto = null;

      Photo.all.forEach(function(photo){
        if (parseInt(photo.get('id')) == parseInt(photoId)) {
          foundPhoto = photo;
        }
      })

      return foundPhoto;
    }

  })

  _.extend(Photo.prototype, {

    get: function(attr_name) {
      return this.attributes[attr_name];
    },

    set: function(attr_name, val) {
      return this.attributes[attr_name] = val;
    },

    create: function(callback) {
      var that = this;

      $.ajax({
        url: "api/photos",
        type: "POST",
        data: { photo: that.attributes },
        success: function(attrs) {
          _.extend(that.attributes, attrs);
          Photo.all.push(that);
          Photo.trigger("add");
        }
      })
    },

    update: function(callback) {
      var that = this;

      $.ajax({
        url: "api/photos/" + this.get(id),
        type: "PUT",
        success: function(attrs) { _.extend(that.attributes, attrs); }
      })
    },

    save: function(callback) {
      if(this.get(id)) {
        this.update(callback);
      } else {
        this.create(callback);
      }
    }
  })

})(this)