class SessionsController < ApplicationController

  def create
    logger.info(auth_hash)
    logger.info(auth_hash['info'])

    unless @auth = Authorization.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
      @auth = Authorization.create_from_auth_hash(auth_hash)
    end
    self.current_user= @auth.user

    return redirect_to explore_path
  end
  
  def new; end

  def destroy
    reset_session
    redirect_to root_path
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end

end
