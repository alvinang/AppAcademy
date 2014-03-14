window.Trellino.Routers.AppRouter = Backbone.Router.extend({
  
  initialize: function(options) {
    this.$rootEl = options.$rootEl
  },
  
  routes: {
    "": "boardIndex",
    "/boards": "boardNew"
  },
  
  boardIndex: function() {
    this.boardIndexView = new Trellino.Views.BoardsIndex({
      collection: Trellino.boards
    });
    
    this._swapView(this.boardIndexView);
  },
  
  // boardNew: function() {
  //   this.boardNewView = new Trellino.Views.BoardsNew({
  //     model: new Trellino.Models.Board();
  //   });
  //   
  //   this._swapView(this.boardNewView);
  // }
  
  _swapView: function(view){
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
  
});