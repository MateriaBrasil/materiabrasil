# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  definition      :string(255)
#  email           :string(255)
#  phone_first     :string(255)
#  phone_second    :string(255)
#  manufacturer_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address         :string(255)
#  rescrict        :boolean
#

class Contact < ActiveRecord::Base
  validates_presence_of :definition
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone_first

  belongs_to :manufacturer

end
