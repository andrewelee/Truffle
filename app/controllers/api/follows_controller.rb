class Api::FollowsController < ApplicationController

  def index
    @follows = Follow.all
  end

  def create
    @follow = Follow.new(follow_params)
    @follow.save
    render partial: "api/follows/follow.json", locals: { follow: @follow }
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    #render json: @follow
    render json: @follow
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :followed_id)
  end

end