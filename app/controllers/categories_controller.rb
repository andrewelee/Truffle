class CategoriesController < ApplicationController

  def index
    @categories = Category.all.includes(:products)

    render :index
  end

  def new
    @category = Category.new
    render :new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to :index
    else
      flash.now[:errors] = @category.errors.full_messages
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products

    if params[:sort] == "popular"
      @products = @products.select("products.*, COUNT(user_id) AS likes").joins(:likes).group("products.id")
      @products = @products.order("likes DESC")
    elsif params[:sort] == "most-expensive"
      @products = @products.order("price desc")
    elsif params[:sort] == "least-expensive"
      @products = @products.order("price asc")
    end

    render :show
  end

  def edit
    @category = Category.find(params[:id])
    render :edit
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to :index
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
