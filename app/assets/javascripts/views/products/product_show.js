Truffle.Views.ProductShow = Backbone.View.extend({

  template: JST['products/show'],

  render: function () {
    var content = this.template({ product: this.model });
    this.$el.html(content);
    return this;
  }
});