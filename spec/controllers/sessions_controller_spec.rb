require 'spec_helper'

describe SessionsController do

  describe "#create" do
    before do
      get :create, provider: :facebook
    end
    it { expect(response).to redirect_to(root_path) }
  end

end
