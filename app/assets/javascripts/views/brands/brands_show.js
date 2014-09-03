Truffle.Views.BrandShow = Backbone.View.extend({
  template: JST['brands/show'],

  render: function () {
    var content = this.template({ brand: this.model });
    this.$el.html(content);
    return this;
  }

});