Truffle.Routers.Products = Backbone.Router.extend({
  initialize: function(products, element){
    this.products = products;
    this.$element = $(element);
  },

  routes: {
    'products/:id' : 'show'
  },

  show: function(id){
    var product = this.products.get({id: id});
    var productView = new Truffle.Views.ProductShow({model: product});
    this.$element.html(productView.render().$el);
  }

});

