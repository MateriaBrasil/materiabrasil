# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include Pundit

  before_filter :set_locale
  after_filter :store_location

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to request.env["HTTP_REFERER"] || root_url, flash: { error: 'Você não está autorizado a realizar esta ação.' }
  end

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
