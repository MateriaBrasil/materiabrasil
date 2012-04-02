require "spec_helper"

describe Contact do
  describe "Validations & Associations" do
    it { should validate_presence_of :manufacturer }
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone_first }


    it { should belong_to :manufacturer }
    it { should accepts_nested_attribute_for :contacts }
  end
end
