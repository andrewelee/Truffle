Truffle.Views.ProductsIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['products/index'],

  // tagName: "li",

  events: {
      'click .product-image' : 'renderModal'
      // 'click' : 'shuffle'
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

  renderModal: function() {
    var id = $(event.target).attr('data-id');
    var product = new Truffle.Models.Product({id: id});
    product.fetch();

    console.log(id)

    $("#modal").addClass("is-active");
		
	  $("body").addClass("modal-open");

    $('.modal-content').html(
      JST['products/modal']({
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