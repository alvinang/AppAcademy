window.Trellino.Views.ListShow = Backbone.View.extend({
  template: JST['lists/show'],
  
  render: function() {
    var renderedContent = this.template({
      list: this.list
    });
    
    this.$el.html(renderedContent);
    return this;
  }
  
});

// window.Trellino.Views.BoardShow = Backbone.CompositeView.extend({
//   template: JST['boards/show'],
//   
//   initialize: function(id) {
//     this.listenTo(this.model, "sync", this.render);
//     this.listenTo(this.model.lists(), "add", this.addList);
//     this.listenTo(this.model.lists(), "remove", this.removeList);
//     
//     this.model.lists().each(this.addList.bind(this));
//     
//     var listNewView = new Trellino.Views.ListNew({
//       board: this.model
//     });
//     
//     this.addSubview(".list-new", listNewView)    
//   },
//   
//   addList: function(list) {
//     var listShowView = this.template({
//       list: list 
//     });
//     
//     this.addSubviews(".list-item", listShowView);
//     listShowView.render();
//   },
//   
//   removeList: function(list) {
//     var listShowView = 
//       _(this.subviews()[".list-item"]).find(function(subview){
//         return subview.model == list
//       });
//       
//     this.removeSubview(".list-item", list);  
//   },
// 
//   render: function() {
//     var renderedContent = this.template({
//       board: this.model
//     });
//         
//     this.$el.html(renderedContent);
//     this.renderSubviews();
//     
//     return this;
//   }
//   
// });