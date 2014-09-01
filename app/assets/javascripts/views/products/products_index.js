Truffle.Views.ProductsIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync", this.render);
  },

  template: JST['products/index'],

  // tagName: "li",

  events: {
      'click' : 'renderModal'
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
    $("#modal").addClass("is-active");

    // $('.modal-content').html(
    //   JST['products/modal']({
    //     product: this.model
    //   })
    // )

    $('.hide-modal').on('click', function() {
      $('#modal').removeClass("is-active");
    })

  },

  hideModal: function() {
    $('#modal').removeClass("is-active");
  }

});