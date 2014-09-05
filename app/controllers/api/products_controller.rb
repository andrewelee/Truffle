class Api::ProductsController < ApplicationController

  def index
    @products = Product.all.includes(likes: :user)

    render :index
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  private

  def product_params
    params.require(:product).permit(:name, :url, :price, :note, :brand_id,
                   :category_id, :finder_user_id, :editor_user_id, :image)
  end

end
