class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      user_params[:idInput],
      user_params[:password])

    if @user
      log_in_user(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    end
  end

  def destroy
    log_out_user
    redirect_to new_session_url
  end

  def user_params
    params.require(:user).permit(:idInput, :password)
  end

end
