Truffle.Collections.Brands = Backbone.Collection.extend({
  model: Truffle.Models.Brand,
  url: '/api/brands',
	getOrFetch: function (id) {
    var brands = this;
    var brand;
		
    if (!(brand = this.get(id))) {
      brand = new Truffle.Models.Brand({ id: id });
      brand.fetch({ success: function () { brands.add(brand); } });
		}
	
    return brand;
	}
});