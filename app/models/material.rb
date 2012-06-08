class Material < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :manufacturer
  has_many :images
  has_many :attachments
  has_and_belongs_to_many :categories, before_add: :validates_category
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :attachments
  validates :manufacturer, :name, :resume, :technical_observation, :density, :packing, :average_price, presence: true

  default_scope order('created_at DESC')
  
  after_save :check_tree
  before_save :set_material_code
    
  def should_generate_new_friendly_id?
    new_record?
  end

  def sku
    "#{self.code.upcase}-#{self.id.to_s.rjust(5,'0')}"
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

    def set_material_code
      uses      = Category.find_by_name("Uso-Chave")
      classes   = Category.find_by_name("Classe-Chave")
      cats      = self.categories.select { |s| s.code_reference != "" and s.parents.include?(uses) or s.parents.include?(classes) }
      if cats
        cls     = cats.select { |s| s.parents.include?(classes) and !s.parents.include?(uses) }.last
        use     = cats.select { |s| s.parents.include?(uses) and !s.parents.include?(classes) }.last
        if cls and use
          self.code = "#{use.code_reference}-#{cls.code_reference}" 
        end
      end
    end
end



