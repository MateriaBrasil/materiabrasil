class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def is_logged_in?
    !!current_user
  end

  helper_method :current_user, :is_logged_in?

  def current_user=(user)
    @current_user = user
    session[:user] = @current_user.id
  end
end
