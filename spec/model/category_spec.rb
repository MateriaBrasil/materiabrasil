require 'spec_helper'

describe Category do
  describe "Validations & Associations" do
    it { should validate_presence_of :name }
    it { should have_many :subcategories }
    it { should belong_to :parent }
  end
end
