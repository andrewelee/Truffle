class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?, :is_editor?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def log_in_user(user)
    session[:session_token] = user.reset_session_token
  end

  def log_out_user
    current_user.reset_session_token
    session[:session_token] = nil
  end

  def is_editor?
    current_user.isEditor == true
  end

end
