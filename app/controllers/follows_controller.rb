class FollowsController < ApplicationController

  def create
    @follow = Follow.new(follow_params)
    @follow.save
    redirect_to user_url(@follow.followed_id)
  end

  def destroy
    @follow = Follow.find_follow(
      params[:follow][:follower_id],
      params[:follow][:followed_id])
    @follow.destroy
    redirect_to user_url(@follow.followed_id)
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :followed_id)
  end

end