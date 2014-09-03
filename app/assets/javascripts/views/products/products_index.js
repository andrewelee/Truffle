Truffle.Views.ProductsIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync change reset", this.render);
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
    this.collection.reset(this.collection.shuffle(), {silent:true});
    this.render();
  },

  renderProduct: function() {
    var id = $(event.target).attr('data-id');
    var product = new Truffle.Models.Product({id: id});
    product.fetch();

    $("#modal").addClass("is-active");

	  $("body").addClass("modal-open");

    $('.modal-content').html(
      JST['products/product-modal']({
        product: this.collection.get(id)
      })
    )

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
    })

  },

  hideModal: function() {
    $('#modal').removeClass("is-active");
  }

});