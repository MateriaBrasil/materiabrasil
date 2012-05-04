class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :subcategories, :class_name => :Category, :foreign_key => :parent_id
  has_and_belongs_to_many :materials
  belongs_to :parent, :class_name => :Category

  acts_as_tree

  scope :parent, where(parent_id: nil)


  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end


  def siblings
    Category.where(parent_id: self.parent_id)
  end

  def parents
    self.parent ? [].concat(self.parent.parents << self.parent) : []
  end
end
