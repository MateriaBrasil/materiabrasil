class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  has_many :subcategories, :class_name => :Category, :foreign_key => :parent_id, dependent: :destroy
  has_and_belongs_to_many :materials
  belongs_to :parent, :class_name => :Category

  acts_as_tree

  scope :parent_elements, where(parent_id: nil, is_visible: [true, nil])

  def siblings
    Category.where(parent_id: self.parent_id)
  end

  def visible_siblings
    self.siblings.select { |s| s.is_visible != false}
  end

  def parents
    self.parent ? [].concat(self.parent.parents << self.parent) : []
  end
  
  def should_generate_new_friendly_id?
    new_record?
  end
end
