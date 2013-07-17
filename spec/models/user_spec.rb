require "spec_helper"

describe User do
  let(:user) { User.make!}

  subject{ user }
  describe "Validations & Associations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  it { should be_valid }

  describe "password required" do
    before { user.password = nil }
    it { should_not be_valid }
  end

  describe "password confirmation must match password" do
    before do
      user.password = 'password'
      user.password_confirmation = 'pwconfirmation'
    end
    it { should_not be_valid }
  end

  describe "validations" do
    it { should have_many :authorizations }
  end
end
