Truffle.Views.UserShow = Backbone.View.extend({
  initialize:
    function() {
      $('#modal').removeClass("is-active");
    },

  template: JST['users/show'],

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  }
});