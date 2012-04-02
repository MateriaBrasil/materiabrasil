class Manufacturer < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :email

  has_many :contacts
  has_many :materials

  accepts_nested_attributes_for :contacts
end
