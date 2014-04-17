# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  parent_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  code_reference :string(3)
#  slug           :string(255)
#  is_visible     :boolean
#

class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name
  has_many :subcategories, :class_name => :Category, :foreign_key => :parent_id, dependent: :destroy
  has_and_belongs_to_many :materials
  has_many :children, class_name: :Material, foreign_key: :category_id
  belongs_to :parent, :class_name => :Category

  acts_as_tree
  default_scope order('name ASC')
  scope :top_level, where(parent_id: nil)
  scope :parent, where(parent_id: nil)

  def siblings
    Category.where(parent_id: self.parent_id)
  end

  def parents
    self.parent ? [].concat(self.parent.parents << self.parent) : []
  end

  def should_generate_new_friendly_id?
    new_record?
  end
end
