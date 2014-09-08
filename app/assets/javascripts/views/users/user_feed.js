Truffle.Views.UserFeed = Backbone.View.extend({

  initialize: function(options) {
    this.listenTo(this.model, "sync change reset sort", this.render);
  },

  template: JST['products/index'],

  events: {
    },

  render: function(){
		var followed = Truffle.currentUser.followedUsers();
		var followedIds = followed.pluck("followed_id");
		var products = new Truffle.Collections.Products();
		
		_(followedIds).each(function(id) {
			var user = Truffle.users.getOrFetch(id);
			console.log(user);
			products.add(user.get('likedProducts'))
		});
		
		// products.comparator = function (product) {
		// 	return -Date.parse(product.get("created_at"));
		// }
		// products.sort();
		
		console.log(products);
		
		console.log(followedIds);
		
    var content = this.template({ products: products });
    this.$el.html(content);
		//$('.product-box').css('opacity', '0').fadeTo(500, 1,'swing');
    return this;
  }

});