require 'spec_helper'

describe Category do
  describe "Validations & Associations" do
    it { should validate_presence_of :name }
    it { should have_many :subcategories }
    it { should belong_to :parent }
  end


  describe "#siblings" do
    context "When there's no siblings" do
      its(:siblings) { should be_empty }
    end
    context "When there's one sibling" do
      let(:parent)  { Category.make! }
      let(:sibling) { Category.make!(parent: parent) }
      before { subject.parent = parent }

      its(:siblings) { should == [sibling] }
    end
    context "When there's more than one sibling" do
      let(:parent)   { Category.make! }
      let(:sibling1) { Category.make!(parent: parent) } 
      let(:sibling2) { Category.make!(parent: parent) } 
      let(:sibling3) { Category.make!(parent: parent) } 
      before { subject.parent = parent }

      its(:siblings) { should == [sibling1, sibling2, sibling3] }
    end
  end


  describe "#parents" do
    context "When there is no parent :(" do
      its(:parents) { should be_empty }
    end
    context "When there's ONE parent :3" do
      let(:parent) { Category.make! }
      before { subject.parent = parent }

      its(:parents) { should == [parent] }
    end
    context "When there's more than ONE PARENT OMG :D" do
      let(:grandfather) { Category.make! } 
      let(:father) { Category.make!(parent: grandfather) } 
      before { subject.parent = father }

      its(:parents) { should == [grandfather, father] }
    end
    context "When there'is more than two parents :O" do
      let(:grandgrandstepfather) { Category.make!}
      let(:grandstepfather)      { Category.make!(parent: grandgrandstepfather) }
      let(:grandfather)          { Category.make!(parent: grandstepfather) }
      let(:father)               { Category.make!(parent: grandfather) }
      before { subject.parent = father }

      its(:parents) { 
        should == [grandgrandstepfather, grandstepfather, grandfather, father] 
      }
    end
  end
end
