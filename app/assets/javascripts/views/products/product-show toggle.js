Truffle.Views.ProductShowd = Backbone.View.extend({

	initialize: function(){
    alert('h');
		this.product = this.model;

    Truffle.currentUser.fetch();
	},

  template: JST['products/product-modal'],

  events: {
      'click .like' : 'likeToggle'
    },

  render: function () {
    console.log(this.product.id);
    var content = this.template({ product: this.product });
    this.$el.html(content);

    if (Truffle.currentUser.likes().findWhere({product_id: this.model.id})) {
      this.$(".icon-holder").append("<span class='like active'>♥</span>")
    } else {
      this.$(".icon-holder").append("<span class='like'>♥</span>")
    }

    return this;
  },

  likeToggle: function() {
    var like = Truffle.currentUser.likes().findWhere({product_id: this.model.id});

    if (like) {
      like.destroy({
        success: function() {
          console.log("deleted");
        }
      });
    } else {
      var productLike = new Truffle.Models.Like({user_id: Truffle.currentUser.id, product_id: this.model.id});
      Truffle.currentUser.likes.add([{product_id: this.model.id}])
    }

    this.render();
  }
});