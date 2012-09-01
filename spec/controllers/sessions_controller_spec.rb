require 'spec_helper'

describe SessionsController do

  describe "#create" do
    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
      post :create, provider: :facebook
    end

   it { expect(response).to redirect_to(root_path) }
  end

end
