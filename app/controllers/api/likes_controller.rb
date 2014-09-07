class Api::LikesController < ApplicationController

  def index
    @likes = Like.all
  end

  def create
    @like = Like.new(like_params)
    @like.save
    render partial: "api/likes/like.json", locals: { like: @like }
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    render json: @like
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :product_id)
  end

end