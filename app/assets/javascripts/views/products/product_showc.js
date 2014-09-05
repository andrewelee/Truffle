Truffle.Views.ProductShowb = Backbone.View.extend({

	initialize: function(){
		this.product = this.model;

    Truffle.currentUser.fetch();

    var that = this;

    var likes = new Truffle.Collections.Likes();
    likes.fetch({
      success: function() {
        if (likes.findWhere({
        user_id: Truffle.currentUser.id,
        product_id: that.model.id
      })) {
        $('.like').addClass('unlike').removeClass('like')
      } else {
        $('.unlike').addClass('like').removeClass('unlike')
      }}
    });

	},

  template: JST['products/product-modal'],

  events: {
      'click .like' : 'like',
      'click .unlike' : 'unlike'
    },

  render: function () {
    var content = this.template({ product: this.product });
    this.$el.html(content);
    return this;
  },

  unlike: function() {
    console.log("Model: " + this.model.id);
    console.log("User: " + Truffle.currentUser.id);
    var likedProduct = Truffle.currentUser.likes().findWhere({product_id: this.model.id});
    console.log(likedProduct);
    likedProduct.destroy({
        success: function() {

          $('.unlike').addClass('like').removeClass('unlike')
          console.log("deleted");
        }
      });
  },

	like: function() {
    var productLike = new Truffle.Models.Like({user_id: Truffle.currentUser.id, product_id: this.model.id});
    productLike.save()
    Truffle.currentUser.fetch();
    $('.like').addClass('unlike').removeClass('like')
    this.render();
  }
});