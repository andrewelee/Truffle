Truffle.Routers.AppRouter = Backbone.Router.extend({
  initialize: function(products, content, contentNav){
    this.products = products;
    this.categories = new Truffle.Collections.Categories();
		this.$content = content;
		this.$contentNav = contentNav;
  },

  routes: {
    "" : "index",
    "explore" : "index",
    "products/:id" : "productShow",
		"products/new" : "productNew",
		"users/:id": "userShow",
    "categories" : "categoriesIndex",
    "categories/:id" : "categoryShow",
    "brands" : "brandsIndex",
    "brands/:id" : "brandShow"
  },

  index: function(){
    var productsIndex = new Truffle.Views.ProductsIndex({
      collection: this.products
    });
		
		var productNav = new Truffle.Views.ProductNav({});
		this.$contentNav.html(productNav.render().$el);

    this._swapView(productsIndex);
  },

  brandsIndex: function(){
    var brands = new Truffle.Collections.Brands();
    brands.fetch();
    var brandsIndex = new Truffle.Views.BrandsIndex({
      collection: brands
    })
		
		this.$contentNav.html(JST['store-nav']({}))
    this._swapView(brandsIndex)
  },
	
  brandShow: function(id){
		var brand = Truffle.brands.getOrFetch(id)
		
    var brandShow = new Truffle.Views.BrandShow({
      model: brand,
      collection: this.products
      })

		var storeNav = new Truffle.Views.StoreNav({});
		this.$contentNav.html(storeNav.render().$el);
    this._swapView(brandShow)
  },

  categoriesIndex: function(){
    var categories = new Truffle.Collections.Categories();
    categories.fetch()

    var categoriesIndex = new Truffle.Views.CategoriesIndex({
      collection: categories
    })
		
		this.$contentNav.html(JST['store-nav']({}))
    this._swapView(categoriesIndex)
  },

  categoryShow: function(id){
		var category = Truffle.categories.getOrFetch(id);
    var categoryShow = new Truffle.Views.CategoryShow({
      model: category,
      collection: this.products
    })
			
		var storeNav = new Truffle.Views.StoreNav({});
		this.$contentNav.html(storeNav.render().$el);
    this._swapView(categoryShow)
  },

  productShow: function(id){
    var product = this.products.getOrFetch(id);
		//var product = this.products.get({id: id});
    var productShow = new Truffle.Views.ProductShow({model: product});
    this._swapView(productShow);
  },

	userShow: function(id) {
    var user = Truffle.users.getOrFetch(id);
		var userShowView = new Truffle.Views.UserShow({
			model: user
		});
		
		this.$contentNav.empty() 
		this._swapView(userShowView);
	},

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;

    this.$content.html(newView.render().$el);
  }

});

