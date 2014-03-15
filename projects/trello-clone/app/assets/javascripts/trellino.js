window.Trellino = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $rootEl = $('#content');    
    
    new Trellino.Routers.AppRouter({
      $rootEl: $rootEl
    });

    Backbone.history.start();
  }
};

Backbone.CompositeView = Backbone.View.extend({
  
  addSubview: function (selector, view) {
    var selectorSubviews =
      this.subviews()[selector] || (this.subviews()[selector] = []);
    
    selectorSubviews.push(view);
  },
  
  renderSubviews: function() {
    var view = this;
    
    _(this.subviews()).each(function(selectorSubviews, selector) {
      var $selectorEl = view.$(selector).empty();
      
      _(selectorSubviews).each(function(subview) {
        subview.render();
        subview.delegateEvents();
      });
    });
  },
  
  subviews: function() {
    if (!this._subviews) {
      this._subviews = {};
    };
    
    return this._subviews;
  }
});


$(document).ready(function(){
  Trellino.boards = new Trellino.Collections.Boards();
  
  Trellino.boards.fetch({
    success: function() {      
      Trellino.initialize();
    },
    error: function() {
      alert("didn't work");
    }
  }); 
});