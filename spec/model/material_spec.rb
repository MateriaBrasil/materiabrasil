require 'spec_helper'

describe Material do
  describe "Validations & Associations" do
    it { should belong_to :manufacturer }
    it { should have_and_belong_to_many :categories }
    it { should validate_presence_of :manufacturer }
  end


  describe "#check_tree" do
    before do
      @parent   = Category.make! name: "Parent"
      @marked   = Category.make! name: "Checked Category", parent: @parent
      @sibling  = Category.make! name: "Sibling", parent: @parent
      @child    = Category.make! name: "Child", parent: @marked
      @material = Material.make! categories: [@marked]
    end
    subject { @material.categories } 

    it "Should include the parent tree of a category element" do
      subject.should include(@parent, @marked) 
    end

    it "Should not include the sibling of a parent tree or include a children tree" do
      subject.should_not include(@sibling, @child)
    end
  end
end
