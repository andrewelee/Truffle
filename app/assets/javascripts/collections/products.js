Truffle.Collections.Products = Backbone.Collection.extend({
  model: Truffle.Models.Product,
	
  url: '/api/products',
	
	getOrFetch: function (id) {
    var products = this;
    var product;
		
    if (!(product = this.get(id))) {
      product = new Truffle.Models.Product({ id: id });
      product.fetch({ success: function () { products.add(product); } });
		}
	
    return product;
	}
	
});