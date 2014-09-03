class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :avatar)
  end

end

