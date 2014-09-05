Truffle.Views.UserShow = Backbone.View.extend({
  initialize: function() {
    $('#modal').removeClass("is-active");
		this.sort = "none";
  },

  template: JST['users/show'],

	events: {
      'click .liked' : 'filter',
			'click .followers' : 'filter',
			'click .following' : 'filter',
      'click .follow' : 'followToggle'// ,
// 		  'click .product-image' : 'renderProduct',
// 		  'click .like-count' : 'renderLikes'
    },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);

		//Lets add products, followers, or followed (collections in the future?)
		var view = this;

		console.log(this.sort);
		if (this.sort === "followers") {
			var followers = this.model.get('followers');
			var users = new Truffle.Collections.Users(followers);
			var userView = new Truffle.Views.UsersIndex({
				collection: users
			})
		} else if (this.sort === "following") {
			var followedUsers = this.model.get('followedUsers')
			var users = new Truffle.Collections.Users(followedUsers);
			var userView = new Truffle.Views.UsersIndex({
				collection: users
			})
		} else {
			var likedProducts = this.model.get('likedProducts');
			var products = new Truffle.Collections.Products(likedProducts);
			var userView = new Truffle.Views.ProductsIndex({
				collection: products
			})
		}

		console.log(products);
		//userView.undelegateEvents();
		this.$(".products").append(userView.render().$el)
    return this;
  },

	//This sort is setting too slowly sometimes
	filter: function(event) {
		this.sort = event.target.className.split(' ')[0];

		this.render();
	},

  followToggle: function() {
    var id = $(event.target).attr('data-id');
    console.log(id);
  },

  //To be replaced by a specific product show view/modal(?)
  renderProduct: function() {
    event.preventDefault();
    var id = $(event.target).attr('data-id');
		console.log(id);
    var product = new Truffle.Models.Product({id: id});
    product.fetch();
		console.log(product);


    $("#modal").addClass("is-active");

	  $("body").addClass("modal-open");

    $('.modal-content').html(
      JST['products/product-modal']({
        product: product
      })
    )

    $('.hide-modal').on('click', function() {
			$("body").removeClass("modal-open")
      $('#modal').removeClass("is-active");
    })

  }
});