Truffle.Routers.Products = Backbone.Router.extend({
  initialize: function(products, element){
    this.products = products;
    this.$element = $(element);
  },

  routes: {
    "" : "index",
    'products' : 'index',
    'products/:id' : 'show',
    'products/category' : 'category'

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

  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;

    $("#content").html(newView.render().$el);
  }

});

