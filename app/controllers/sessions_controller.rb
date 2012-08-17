class SessionsController < ApplicationController

  def create
    redirect_to root_path
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
