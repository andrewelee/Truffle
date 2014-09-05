Truffle.Views.ProductNav = Backbone.View.extend({

  template: JST['products/nav'],

	events: {
		'click li' : 'filter',
	},

	filter: function(event) {
		Truffle.pubSub.trigger(event.target.className, {} );
	},

  render: function () {
    var content = this.template({ });
    this.$el.html(content);
    return this;
  }
});