Truffle.Views.StoreNav = Backbone.View.extend({

  template: JST['store-nav-filters'],
	
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