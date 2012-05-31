require 'spec_helper'

describe Material do
  describe "Validations & Associations" do
    it { should belong_to :manufacturer }
    it { should have_and_belong_to_many :categories }
    it { should validate_presence_of :manufacturer }
  end


  describe "#check_tree" do

    context "When is a new material" do
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

  describe "#set_material_code" do
    before do
      @classes        = Category.make! name: "Classes"
      @uses           = Category.make! name: "Usos"
      @child_classes  = Category.make! name: "SubClasses" , code_reference: "CLS", parent: @classes
      @child_uses     = Category.make! name: "SubUses"    , code_reference: "USS", parent: @uses

      @material       = Material.make! name: "Material"   , categories: [@child_uses, @child_classes] 
    end
  
    subject { @material.sku }
      

    it "Should setup a code that is a result of a concatenation of Classes + Uses + ID" do
      subject.should == "CLSUSS#{@material.id.to_s.rjust(5,'0')}"
    end
  end
end
