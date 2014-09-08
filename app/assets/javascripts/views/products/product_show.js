Truffle.Views.ProductShow = Backbone.View.extend({

	initialize: function(){
		this.product = this.model;
		this.product.fetch();

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
			'submit form#comment-form' : "createComment",
			'click .x' : 'deleteComment',
			'click .hide-modal' : 'closeModal',
      'click .delete-product' : 'deleteProduct'
    },

  render: function () {
    var content = this.template({ product: this.product });
    this.$el.html(content);

		if (Truffle.currentUser.likes().findWhere({product_id: this.model.id})){
	    $('.like').addClass('remove');
	  } else {
	    $('.like').addClass('add');
	  }

	  return this;
  },

	createComment: function() {
		event.preventDefault();
		var that = this;
		var text = $('textarea#textarea-comment-text').val();
		var comment = new Truffle.Models.Comment({
			user_id: Truffle.currentUser.id,
			product_id: this.model.id,
			text: text
		});
		comment.save(null, {
			success: function() {
				Truffle.currentUser.fetch();
				that.model.fetch();
			}
		})
	},

	deleteComment: function() {
		var that = this;
		var id = parseInt($(event.target).attr('data-id'));
		var comments = new Truffle.Collections.Comments;
		comments.fetch({
			success: function(){
				var comment = comments.get(id);
				comment.destroy({
					success: function(){
						that.model.fetch();
					}
				});
			}
		});
	},

	deleteProduct: function() {
		var that = this;
		var id = this.model.id
		var products = new Truffle.Collections.Products;
		products.fetch({
			success: function(){
				var product = products.get(id);
				product.destroy({
					success: function(){
						that.closeModal();
            Truffle.currentUser.fetch();
					}
				});
			}
		});
	},

	closeModal: function() {
		$("body").removeClass("modal-open");
    $('#modal').removeClass("is-active");
	},

	like: function() {
		var that = this;

		if (Truffle.currentUser.likes().findWhere({product_id: this.model.id})){
			var likedProduct = Truffle.currentUser.likes().findWhere({product_id: this.model.id});
			likedProduct.destroy({
				success: function(){
					Truffle.currentUser.fetch();
					that.model.fetch();
				}
			});
		} else {
			var that = this;
	    var productLike = new Truffle.Models.Like({user_id: Truffle.currentUser.id, product_id: this.model.id});
	    productLike.save(null , {
				success: function(){
					Truffle.currentUser.fetch();
					that.model.fetch();
				}
			});
		}
	}

});