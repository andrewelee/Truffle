Truffle.Views.CategoryShow = Backbone.View.extend({
	initialize: function () {
		this.listenTo(this.model, "sync sort reset", this.render);
		Truffle.pubSub.on('popular', this.sortPopular, this);
		Truffle.pubSub.on('expensive', this.sortHighPrice, this);
		Truffle.pubSub.on('affordable', this.sortLowPrice, this);
	},
	
  template: JST['categories/show'],

  events: {
    'click .product-image' : 'renderProduct',
		'click .toggle' : 'renderSubMenu'
  },
	
	sortPopular: function () {
		this.model.set("sort", "popularity");
		this.render();
		this.model.set("sort", null)
	},
	
	sortHighPrice: function () {
		this.model.set("sort", "highPrice");
		this.render();
		this.model.set("sort", null)
	},
	
	sortLowPrice: function () {
		this.model.set("sort", "lowPrice");
		this.render();
		this.model.set("sort", null)
	},

  render: function () {
		//Sort if necessary:
		products = this.model.get('products');
		
		if (this.model.get('sort'))
		{
			console.log('sorting...');
			if (this.model.get('sort') === "popularity") {
				products.sort( function(p1, p2) { 
					return p2.userLikes.length - p1.userLikes.length
				});
			}
			
			if (this.model.get('sort') === "highPrice") {
				products.sort( function(p1, p2) {
					return p2.price - p1.price;
				});
			}
			
			if (this.model.get('sort') === "lowPrice") {
				products.sort( function(p1, p2) {
					return p1.price - p2.price;
				});
			}
		}
		
    var content = this.template({ category: this.model });
		
    this.$el.html(content);
    return this;
  },

  renderProduct: function() {
    event.preventDefault();
    var id = $(event.target).attr('data-id');
    var product = new Truffle.Models.Product({id: id});
    product.fetch();

		$('.modal-content').removeClass("like");
    $("#modal").addClass("is-active");
	  $("body").addClass("modal-open");

		var modalView = new Truffle.Views.ProductShow({
      model: this.collection.get(id)
		})
		
		$('.modal-content').html(modalView.render().$el);

    $('.hide-modal').on('click', function() {
			$("body").removeClass("modal-open")
      $('#modal').removeClass("is-active");
			console.log("closing modal from product index");
    })

  },
	
	renderSubMenu: function() {
		$(".container").toggleClass("open");
		$(".toggle").toggleClass("open");
		$(".sub-menu").toggleClass("open");
	}

});