class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to product_url(@like.product_id)
  end

  def destroy
    @like = Like.find_like(
      params[:like][:user_id],
      params[:like][:product_id])
    @like.destroy
    redirect_to product_url(@like.product_id)
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :product_id)
  end

end