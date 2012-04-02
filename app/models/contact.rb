class Contact < ActiveRecord::Base
  attr_accessible :definition, :email, :manufacturer_id, :name, :phone_first, :phone_second
end
