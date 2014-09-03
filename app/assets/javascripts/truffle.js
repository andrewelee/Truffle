window.Truffle = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    Truffle.users = new Truffle.Collections.Users();
    Truffle.users.fetch();

    var products = new Truffle.Collections.Products();
      products.fetch({
        success: function(){
          var productsIndex = new Truffle.Views.ProductsIndex({collection: products});

          var element = $('#content');

          new Truffle.Routers.AppRouter(products, element);
          Backbone.history.start();
        }
      });
    }
  };

$(document).ready(function(){
  Truffle.initialize();
});