Truffle.Views.CategoriesIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync change reset", this.render);
  },

  template: JST['categories/index'],

  render: function(){
    var content = this.template({ categories: this.collection });
    this.$el.html(content);
    return this;
  }

});