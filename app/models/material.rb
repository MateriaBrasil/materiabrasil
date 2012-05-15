class Material < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :manufacturer
  belongs_to :manufacturer
  has_many :images
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :images

  default_scope order('created_at DESC')
end
