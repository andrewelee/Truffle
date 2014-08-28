class ProductsController < ApplicationController

  def index
    @products = Product.all.includes(likes: :user)

    if params[:filter] == "50"
      @products = @products.where("price < 50")
    end

    if params[:sort] == "new"
      @products = @products.order("created_at desc")
    elsif params[:sort] == "popular"
      @products = @products.select("products.*, COUNT(user_id) AS likes").joins(:likes).group("products.id")
      @products = @products.order("likes DESC")
    elsif params[:sort] == "random"
      @products = @products.shuffle
    end

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

    if @product.price
      @product.price = @product.price.round
    end

    @product.editor_user_id = current_user.id

    if @product.save
      Like.create(user_id: @product.finder_user_id, product_id: @product.id)
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

  def edit
    @product = Product.find(params[:id])
    @users = User.all
    @brands = Brand.all
    @categories = Category.all
    render :edit
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to product_url(@product)
    else
      flash.now[:errors] = @user.errors.full_messages
      @users = User.all
      @brands = Brand.all
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_url
  end

  private

  def product_params
    params.require(:product).permit(:name, :url, :price, :brand_id,
                   :category_id, :finder_user_id, :editor_user_id, :image)
  end

end
