Truffle.Views.UserShow = Backbone.View.extend({
  initialize: function() {
		var that = this;
		this.listenTo(this.model, "sync change", this.render);
		Truffle.currentUser.fetch();
		
		this.model.fetch({
			success: function(){
		    $('#modal').removeClass("is-active");
	   		$("body").removeClass("modal-open");
				that.sort = "none";
			}
		});
		
  },

  template: JST['users/show'],

	events: {
      'click .liked' : 'filter',
			'click .followers' : 'filter',
			'click .following' : 'filter',
      'click .follow' : 'followToggle',
 		  'click .product-image' : 'renderProduct'
// 		  'click .like-count' : 'renderLikes'
    },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
		console.log(this.sort);

		//Lets add products, followers, or followed (collections in the future?)

		//console.log(this.sort);
		if (this.sort === "followers") {
			
			$(".followers").addClass('active');
			var followers = this.model.get('followers');
			var users = new Truffle.Collections.Users(followers);
			var userView = new Truffle.Views.UsersIndex({
				collection: users
			})
		} else if (this.sort === "following") {
			$(".following").addClass('active');
			var followedUsers = this.model.get('followedUsers')
			var users = new Truffle.Collections.Users(followedUsers);
			var userView = new Truffle.Views.UsersIndex({
				collection: users
			})
		} else {
			$(".liked").addClass('active');
			var likedProducts = this.model.get('likedProducts');
			var products = new Truffle.Collections.Products(likedProducts);
			var userView = new Truffle.Views.ProductsIndex({
				collection: products
			})	
		}
		
		//userView.undelegateEvents();
		
		this.$(".products").append(userView.render().$el)
    return this;
  },

	filter: function(event) {
		this.sort = event.target.className.split(' ')[0];
		
		this.model.fetch();
	},

  followToggle: function() {
    var id = parseInt($(event.target).attr('data-id'));
		//var action = event.target.className.split(' ')[1];
    console.log("id: " + id);
		console.log(Truffle.currentUser.id);
		
		var that = this;
		
		var follow = Truffle.currentUser.followedUsers().findWhere({
			followed_id: id
		})
		
		console.log(follow);
		
		if (follow) {
			follow.destroy({
				success: function(){
					console.log("UNFOLLOWED");
					Truffle.currentUser.fetch();
					that.model.fetch();
				}
			})
		} else {
			var follow = new Truffle.Models.Follow({
				follower_id: Truffle.currentUser.id,
				followed_id: id});
				follow.save(null, {
					success: function(){
						console.log("FOLLOWING!");
						Truffle.currentUser.fetch();
						that.model.fetch();
					}
				})
		};
  },

  //To be replaced by a specific product show view/modal(?)
  renderProduct2: function() {
		console.log("renderProduct2")
		var that = this;
    event.preventDefault();
    var id = $(event.target).attr('data-id');
		console.log(id);
    var product = new Truffle.Models.Product({id: id});
    product.fetch();


    $("#modal").addClass("is-active");

	  $("body").addClass("modal-open");

    $('.modal-content').html(
      JST['products/product-modal']({
        product: product
      })
    )

    $('.hide-modal').on('click', function() {
			$("body").removeClass("modal-open");
      $('#modal').removeClass("is-active");
			that.model.fetch();
			console.log("user show!");
    })

  }
});