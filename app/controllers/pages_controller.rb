class PagesController < ApplicationController
  caches_action :splash if Rails.env.production?

  def splash
    render :layout => "splashpage"
  end

  def index; end
end
