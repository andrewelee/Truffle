window.Truffle = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

		//Create pub-sub functionality to communicate between views
		Truffle.pubSub = _.extend({}, Backbone.Events);

		var content = $('#content');
		var contentNav = $('#content-nav');

    Truffle.users = new Truffle.Collections.Users();
		Truffle.categories = new Truffle.Collections.Categories();
		Truffle.brands = new Truffle.Collections.Brands();
    Truffle.users.fetch();
		Truffle.categories.fetch();
		Truffle.brands.fetch();

    var products = new Truffle.Collections.Products();
    products.fetch({
      success: function(){

				if(window.currentUser) {
					Truffle.currentUser = new Truffle.Models.User({ id: window.currentUser.id });
				} else {
				  Truffle.currentUser = new Truffle.Models.User({ id: 0});
				}

				var productsIndex = new Truffle.Views.ProductsIndex({collection: products});

        new Truffle.Routers.AppRouter(products, content, contentNav);
        Backbone.history.start();
        }
    });
 	}
};

$(document).ready(function(){
  Truffle.initialize();
});