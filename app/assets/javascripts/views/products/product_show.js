Truffle.Views.ProductShow = Backbone.View.extend({

	initialize: function(){
		this.product = this.model;
	},

  template: JST['products/product-modal'],
	
  events: {
      'click .favorite' : 'like',
      'click .favorite2' : 'like'
    },

  render: function () {
    var content = this.template({ product: this.product });
    this.$el.html(content);
    return this;
  },
	
	like: function() {
		alert('like');
		alert(Truffle.currentUser.id)
		//var productLike = new Truffle.Models.Like({user_id: Truffle.currentUser.id, product_id: this.model.id});
		// productLike.save(null, {success: function() {
// 			Truffle.currentUser.fetch();
// 			}
// 		})
// 	}
});