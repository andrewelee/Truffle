class ProductsController < ApplicationController

  def index
    @products = Product.all
    render :index
  end

  def new
    @users = User.all
    @brands = Brand.all
    @categories = Category.all
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    @product.price = @product.price.round

    #only editors can post products:
    @product.editor_user_id = current_user.id

    if @product.save
      redirect_to product_url(@product)
    else
      flash.now[:errors] = @product.errors.full_messages
      @users = User.all
      @brands = Brand.all
      @categories = Category.all
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  private

  def product_params
    params.require(:product).permit(:name, :url, :price, :brand_id,
                   :category_id, :finder_user_id,:editor_user_id)
  end

end
