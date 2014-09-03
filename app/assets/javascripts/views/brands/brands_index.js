Truffle.Views.BrandsIndex = Backbone.View.extend({

  initialize: function() {
    console.log(this.collection);
    this.listenTo(this.collection, "sync change reset", this.render);
  },

  template: JST['brands/index'],

  render: function(){
    var content = this.template({ brands: this.collection });
    this.$el.html(content);
    return this;
  }

});