Truffle.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(products, element){
    this.products = products;
    this.$element = $(element);
    this.categories = new Truffle.Collections.Categories();
  },

  routes: {
    "" : "index",
    "products" : "index",
    "products/:id" : "productShow",
		"users/:id": "userShow",
    "categories" : "categoriesIndex",
    "categories/:id" : "categoryShow",
    "brands" : "brands"
  },

  index: function(){
    var productsIndex = new Truffle.Views.ProductsIndex({
      collection: this.products
    });

    this._swapView(productsIndex);
  },

  brandsIndex: function(){
    var brandsIndex = new Truffle.Views.BrandsIndex()
    this._swapView(brandsIndex)
  },

  categoriesIndex: function(){
    // var categories = new Truffle.Collections.Categories();
    this.categories.fetch();

    var categoriesIndex = new Truffle.Views.CategoriesIndex({
      collection: this.categories
    })
    this._swapView(categoriesIndex)
  },

  categoryShow: function(id){

    this.categories.fetch();
    var category = this.categories.get({id: id});

    var categoryShow = new Truffle.Views.CategoryShow({
      model: category,
      collection: this.products
      })

    this._swapView(categoryShow)
  },

  productShow: function(id){
    var product = this.products.get({id: id});
    var productShow = new Truffle.Views.ProductShow({model: product});
    this._swapView(productShow);
  },

	userShow: function(id) {
    var user = Truffle.users.getOrFetch(id);
		var userShowView = new Truffle.Views.UserShow({
			model: user
		});

		this._swapView(userShowView);
	},

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;

    $("#content").html(newView.render().$el);
  }

});

