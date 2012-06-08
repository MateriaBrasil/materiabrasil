class Material < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :manufacturer
  has_many :images, dependent: :destroy
  has_many :attachments, dependent: :destroy
  has_and_belongs_to_many :categories, before_add: :validates_category
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :attachments
  validates :manufacturer, :name, :resume, :technical_observation, :density, :packing, :average_price, presence: true

  default_scope order('created_at DESC')
  
  after_save :check_tree
    
  def should_generate_new_friendly_id?
    new_record?
  end

  def sku
    "#{self.code}-#{self.id.to_s.rjust(5,'0')}"
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



