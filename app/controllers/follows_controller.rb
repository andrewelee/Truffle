class FollowsController < ApplicationController

  def create
    @follow = Follow.new(follow_params)
    @follow.save
    redirect_to user_url(@follow.followed_user_id)
  end

  def destroy
    @follow = Follow.find_follow(
      params[:follow][:user_id],
      params[:follow][:followed_user_id])
    @follow.destroy
    redirect_to user_url(@follow.followed_user_id)
  end

  private

  def follow_params
    params.require(:follow).permit(:user_id, :followed_user_id)
  end

end