window.Trellino.Routers.AppRouter = Backbone.Router.extend({
  
  initialize: function(options) {
    this.$rootEl = options.$rootEl
  },
  
  routes: {
    "": "boardIndex",
    "boards/new": "boardNew",
    "boards/:id": "boardShow"  
  },
  
  boardIndex: function() {
    var boardIndexView = new Trellino.Views.BoardsIndex({
      collection: Trellino.boards
    });
    
    this._swapView(boardIndexView);
  },
  
  boardNew: function() {
    var boardNewView = new Trellino.Views.BoardNew({
      model: new Trellino.Models.Board()
    });
        
    this._swapView(boardNewView);    
  },
  
  boardShow: function(id) {
    var boardShowView = new Trellino.Views.BoardShow({
      model: Trellino.boards.getOrFetch(id)      
    })
    
    this._swapView(boardShowView);
  },
  
  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
  
});