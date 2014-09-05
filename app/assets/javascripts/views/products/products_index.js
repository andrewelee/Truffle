Truffle.Views.ProductsIndex = Backbone.View.extend({

  initialize: function(options) {
    this.listenTo(this.collection, "sync change reset sort", this.render);
		Truffle.pubSub.on('random', this.shuffle, this);
		Truffle.pubSub.on('popular', this.sortPopular, this);
		Truffle.pubSub.on('new', this.sortNew, this);
		Truffle.pubSub.on('everything', this.everything, this);
		Truffle.pubSub.on('50', this.fifty, this);
  },

  template: JST['products/index'],

  events: {
      'click .product-image' : 'renderProduct',
      'click .like-count' : 'renderLikes'
    },

  render: function(){
    var content = this.template({ products: this.collection });
    this.$el.html(content);
    return this;
  },

  shuffle: function() {
		console.log('shuffle');
		this.collection.comparator = function (product) {};
		this.collection.reset(this.collection.shuffle());
  },

	sortPopular: function() {
		this.collection.comparator = function (product) {
			return -(product.get("likes"));
		}
		this.collection.sort();
	},

	sortNew: function() {
		this.collection.comparator = function (product) {
			return -Date.parse(product.get("created_at"));
		}
		this.collection.sort();
	},

	fifty: function() {
		var filtered = this.collection.filter(function(product){
			return product.get('price') < 50;
		})
		this.collection.reset(filtered);
	},

	everything: function() {
		this.collection.fetch({reset: true});
	},

  renderProduct: function() {
    event.preventDefault();
    var id = $(event.target).attr('data-id');
    var product = new Truffle.Models.Product({id: id});
    product.fetch();

    $("#modal").addClass("is-active");

	  $("body").addClass("modal-open");

		//
		var modalView = new Truffle.Views.ProductShow({
      model: this.collection.get(id)})
		$('.modal-content').html(modalView.render().$el);


    // $('.modal-content').html(
    //   JST['products/product-modal']({
    //     product: this.collection.get(id)
    //   })
    // )

    $('.hide-modal').on('click', function() {
			$("body").removeClass("modal-open")
      $('#modal').removeClass("is-active");
    })

  },

  renderLikes: function() {
    var id = $(event.target).attr('data-id');
    var product = new Truffle.Models.Product({id: id});
    product.fetch();

    $("#modal").addClass("is-active");
    $('.modal-content').addClass("like");

    //hoping to prevent background scroll during modal:
	  $("body").addClass("modal-open");


    $('.modal-content').html(
      JST['products/likers-modal']({
        product: this.collection.get(id)
      })
    )

    $('.hide-modal').on('click', function() {
			$("body").removeClass("modal-open")
      $('#modal').removeClass("is-active");
      $('.modal-content').removeClass("like");
    })

  },

  hideModal: function() {
    $('#modal').removeClass("is-active");
  }

});