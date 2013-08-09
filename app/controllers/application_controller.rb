class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  after_filter :store_location

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end
end
