class Material < ActiveRecord::Base

  belongs_to :manufacturer
  has_and_belongs_to_many :categories
  validates_presence_of :manufacturer
end
