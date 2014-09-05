class Api::LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to '/#/'
  end

  def destroy
    # @like = Like.find_like(
    #   params[:like][:user_id],
    #   params[:like][:product_id])
    @like = Like.find(params[:id])
    @like.destroy
    render status: 200
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :product_id)
  end

end