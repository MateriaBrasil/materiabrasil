class PagesController < ApplicationController
  caches_action :index if Rails.env == :production

  def index
  end
end
