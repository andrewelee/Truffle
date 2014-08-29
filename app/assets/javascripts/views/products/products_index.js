Truffle.Views.ProductsIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  events: {
    "click a.show" : "renderModal"
  },

  template: JST['products/index'],

  render: function(){
    var content = this.template({ posts: this.collection });
    this.$el.html(content);
    return this;
  },

  renderModal: function() {
    $('.modal-screen').addClass('active');
    $('.modal-product').addClass('active');

    $('.modal-product').html(
      JST['products/product_modal']({
        card: this.model,
        items: this.model.items()
      })
    )

    $('.modal-screen').on('click', function() {
      $('.modal-screen').empty();
      $('.modal-product').empty();

      $('.modal-screen').removeClass('active');
      $('.modal-product').removeClass('active');
    })

  }
});