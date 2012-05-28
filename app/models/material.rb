class Material < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :manufacturer
  belongs_to :manufacturer
  has_many :images
  has_many :attachments
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :attachments

  default_scope order('created_at DESC')
  
  before_save :check_tree

  def should_generate_new_friendly_id?
    new_record?
  end

  def check_tree
    tree = []
    self.categories.map do |cat|
      tree << cat.parents
    end

    self.categories << tree
  end
end



