window.Truffle = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    //alert("hi");
    var products = new Truffle.Collections.Products();
      products.fetch({
        success: function(){
          var productsIndex = new Truffle.Views.ProductsIndex({collection: products});
          var element = $('#content');

          var navBar = new Truffle.Views.navBar();
          $('#navBar').html(navBar.render().$el);

          new Truffle.Routers.Products(products, element);
          Backbone.history.start();
        }
      });
    }
  };

$(document).ready(function(){
  Truffle.initialize();
});