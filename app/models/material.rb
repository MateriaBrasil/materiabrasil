# == Schema Information
#
# Table name: materials
#
#  id                    :integer          not null, primary key
#  resume                :text
#  manufacturer_id       :integer
#  technical_observation :text
#  density               :string(255)
#  dimensions            :string(255)
#  average_price         :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  name                  :string(255)
#  slug                  :string(255)
#  ncm                   :string(255)
#  certifications        :string(255)
#  awards                :string(255)
#  code                  :string(255)
#  draft                 :boolean          default(TRUE), not null
#

class Material < ActiveRecord::Base
  include PgSearch
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :manufacturer
  has_one :user, through: :manufacturer
  has_many :images, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_and_belongs_to_many :categories, before_add: :validates_category
  belongs_to :category
  validates :manufacturer, :name, :resume, presence: true
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :attachments
  attr_accessible :images_attributes, :attachments_attributes, :category_ids, :name, :resume, :dimensions, :density, :average_price, :certifications, :awards, :technical_observation, :category_id

  default_scope order('created_at DESC')

  after_save :check_tree


  pg_search_scope :search_by_name_and_category, against: [:name, :code, :resume], associated_against: {
    categories: [:name, :code_reference],
    manufacturer: [:name]
  }

  scope :approved, where(draft: false)

  def should_generate_new_friendly_id?
    new_record?
  end

  def sku
    "#{self.code}-#{self.id.to_s.rjust(5,'0')}"
  end

  def categories_string(pid, name = nil)
    if name
      categories.map{|c| c.name if c.parent && c.parent.name == name}.reject{|c| c.nil?}.join(', ')
    elsif pid
      categories.map{|c| c.name if c.parent_id == pid}.reject{|c| c.nil?}.join(', ')
    end
  end

  def has_images?
    images.length > 0
  end

  def published?
    self.draft == false
  end

  private
  def check_tree
    tree = []
    self.categories.each do |cat|
      tree << cat.parents
    end
    self.categories << tree
  end

  def validates_category(category)
     self.categories.delete(category) if self.categories.include? category
  end
end
