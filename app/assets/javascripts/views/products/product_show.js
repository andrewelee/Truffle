Truffle.Views.ProductShow = Backbone.View.extend({

	initialize: function(){
		this.product = this.model;
		this.listenTo(this.model, "sync change reset", this.render);

    Truffle.currentUser.fetch();

    var that = this;

    var likes = new Truffle.Collections.Likes();
    likes.fetch({
      success: function() {
        if (likes.findWhere({
        user_id: Truffle.currentUser.id,
        product_id: that.model.id
      })) {
				console.log("like exists");
        $('.like').addClass('remove');
      } else {
				console.log("like doesn't exist");
        $('.like').addClass('add');
      }}
    });

	},

  template: JST['products/product-modal'],

  events: {
      'click .like' : 'like',
			'click .hide-modal' : 'closeModal'
    },

  render: function () {
		console.log("Render!")
    var content = this.template({ product: this.product });
    this.$el.html(content);
		    
		if (Truffle.currentUser.likes().findWhere({product_id: this.model.id})){
			console.log("like exists");
	    $('.like').addClass('remove');
	  } else {
			console.log("like doesn't exist");
	    $('.like').addClass('add');
	  }
  
	  return this;
  },
	
	closeModal: function() {
		$("body").removeClass("modal-open");
    $('#modal').removeClass("is-active");
	},
	
	like: function() {
		var that = this;
		
		if (Truffle.currentUser.likes().findWhere({product_id: this.model.id})){
			console.log("UNLIKING");
			var likedProduct = Truffle.currentUser.likes().findWhere({product_id: this.model.id});
			likedProduct.destroy({
				success: function(){
					console.log("DELETED");
					Truffle.currentUser.fetch();
					that.model.fetch();
				}
			});
			
		} else {
			console.log("firing LIKE");
			var that = this;
	    var productLike = new Truffle.Models.Like({user_id: Truffle.currentUser.id, product_id: this.model.id});
	    productLike.save(null , {
				success: function(){
					console.log("ADDED");
					Truffle.currentUser.fetch();
					that.model.fetch();
				}
			});
			
		}
	}

});