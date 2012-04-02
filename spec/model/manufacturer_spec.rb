require 'spec_helper'

describe Manufacturer do
  describe "Validations & Associations" do
    it { should have_many :materials }
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end
end
