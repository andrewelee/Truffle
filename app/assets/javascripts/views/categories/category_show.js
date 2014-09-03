Truffle.Views.CategoryShow = Backbone.View.extend({
  template: JST['categories/show'],

  render: function () {
        console.log(this.model);
    var content = this.template({ category: this.model });
    this.$el.html(content);
    return this;
  }

});