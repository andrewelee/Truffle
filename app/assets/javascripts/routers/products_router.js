Truffle.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(products, element){
    this.products = products;
    this.$element = $(element);
  },

  routes: {
    "" : "index",
    "products" : "index",
    "products/:id" : "show",
		"users/:id": "userShow",
    "products/category" : "category"

  },
  index: function(){
    var productsIndex = new Truffle.Views.ProductsIndex({collection: this.products});
    this._swapView(productsIndex);
  },

  show: function(id){
    var product = this.products.get({id: id});
    var productShow = new Truffle.Views.ProductShow({model: product});
    this._swapView(productShow);
  },
	
	userShow: function (id) {
		var userShowView = new Truffle.Views.UserShow({
			user: Truffle.users.getOrFetch(id)
		});
	
		this._swapViews(userShowView);
	},

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;

    $("#content").html(newView.render().$el);
  }

});

