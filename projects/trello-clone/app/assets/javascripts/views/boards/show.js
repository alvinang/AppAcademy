window.Trellino.Views.BoardShow = Backbone.CompositeView.extend({
  template: JST['boards/show'],
  
  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.lists(), "add", this.addList);
    this.listenTo(this.model.lists(), "remove", this.removeList);
    
    this.model.lists().each(this.addList.bind(this));
    
    var listNewView = new Trellino.Views.ListNew({
      list: this.model
    });
    
    this.addSubview("#add-list", listNewView);
  },
  
  addList: function(list) {
    var listShowView = new Trellino.Views.ListShow({
      model: list
    });
    
    this.addSubview(".board-lists", listShowView)
    listShowView.render();
  },
  
  removeList: function(list) {
    var listShowView = 
      _(this.subviews()['.board-lists']).find(function (subview) {
        return subview.model == comment;
      });
    
    this.removeSubview(".board-list", listShowView);
  },
  
  render: function() {
    var renderedContent = this.template({
      board: this.model
    });
    
    this.$el.html(renderedContent);
    this.renderSubviews();
    debugger
    return this;
  }
  
});

// window.Trellino.Views.BoardShow = Backbone.View.extend({  
//   
//   template: JST['boards/show'],  
//   
//   initialize: function() {
//     this.listenTo(this.model, 'sync', this.render);
//     this.listenTo(this.model, 'change', this.render);
//     this.listenTo(this.model.lists(), 'add sync', this.render);
//   },
//   
//   events: {
//     'click button.delete-board': 'removeBoard',  
//     'click button.new-list': 'addList',
//     'click button.list-destroy': 'removeList',
//     'click button.add-card': 'addCard'  
//   },
//   
//   render: function() {
//     var renderedContent = this.template({
//       board: this.model    
//     });    
//         
//     this.$el.html(renderedContent);
//     return this;
//   },
//   
//   removeBoard: function(event) {
//     event.preventDefault();
//     var that = this;  
//     var boardModel = Trellino.boards.get({id: this.model.id})
//     
//     boardModel.destroy({
//       success: function() {
//         Trellino.boards.remove({ id: that.model.id })
//         that.render();
//         Backbone.history.navigate("/", {trigger: true})        
//       }
//     })
//   },
//   
//   addList: function(event) {
//     var newListView = new Trellino.Views.ListNew({
//       model: this.model    
//     });
//     
//     this.$el.find('#add-list').append(newListView.render().$el);
//   },
//   
//   showList: function() {
//     var newShowView = new Trellino.Views.ListShow({
//       model: this.model
//     });
//     
//     this.$el.find('.board-lists').append(newShowView.render().$el);
//   },
//   
//   removeList: function(event) {
//     event.preventDefault();    
//     var that = this;
//     var listId = $(event.target).parent().data('list-id');
//     var listModel = this.model.lists().get({ id: listId });
//     
//     listModel.destroy({
//       success: function() {
//         that.model.lists().remove({ id: listId })  
//         that.render();        
//       }, 
//       error: function() {
//         alert('Did not destroy');
//       }
//     })
//   }
//   
//   // addCard: function(event) {
//   //   event.preventDefault();
//   //   
//   //   var listId = $(event.target).parent().parent().children().first().children().data('list-id')
//   //   var newCardView = new Trellino.Views.CardNew({
//   //     model: this.model.lists().get({id: listId})
//   //   })
//   //   
//   //   this.$el.find('.add-cards-in-list').append(newCardView.render().$el);
//   // }
//     
// });