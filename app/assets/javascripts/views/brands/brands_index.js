Truffle.Views.BrandsIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync change reset", this.render);
  },

  events: {
		'click .product-image' : 'renderProduct',
    },

  template: JST['brands/index'],

  render: function(){
    var content = this.template({ brands: this.collection });
    this.$el.html(content);
    return this;
  },

  renderProduct: function() {
    event.preventDefault();
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

  }

});