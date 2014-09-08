Truffle.Views.CategoriesIndex = Backbone.View.extend({

  initialize: function() {
    this.listenTo(this.collection, "sync change reset", this.render);
  },

  template: JST['categories/index'],

  events: {
    'click .category-product' : 'renderProduct'
  },

  render: function(){
    var content = this.template({ categories: this.collection});
    this.$el.html(content);
    return this;
  },

  renderProduct: function(){
    console.log($(event.target).attr('data-id'));
    var id = parseInt($(event.target).attr('data-id'));

		$('.modal-content').removeClass("like");
    $("#modal").addClass("is-active");
	  $("body").addClass("modal-open");

    var modalView = new Truffle.Views.ProductShow({
      model: Truffle.products.get(id)
    })
    $('.modal-content').html(modalView.render().$el);

    $('.hide-modal').on('click', function() {
			$("body").removeClass("modal-open");
      $('#modal').removeClass("is-active");
      $('.modal-content').empty();
    })

  }

});