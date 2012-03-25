class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :subcategories, :class_name => :Category, :foreign_key => :parent_id
  belongs_to :parent, :class_name => :Category

  acts_as_tree :order => "code_reference"

end
