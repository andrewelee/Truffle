Truffle.Collections.Categories = Backbone.Collection.extend({
  model: Truffle.Models.Category,
  url: '/api/categories',
	getOrFetch: function (id) {
    var categories = this;
    var category;
		
    if (!(category = this.get(id))) {
      category = new Truffle.Models.Category({ id: id });
      category.fetch({ success: function () { categories.add(category); } });
		}
	
    return category;
	}
});