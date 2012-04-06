class Contact < ActiveRecord::Base
  validates_presence_of :definition
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone_first

  belongs_to :manufacturer

end
