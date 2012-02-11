require 'spec_helper'

describe Material do
  describe "Validations & Associations" do
    it { should belong_to :manufacturer }
    it { should have_and_belong_to_many :categories }
    it { should validate_presence_of :manufacturer }
  end
end
