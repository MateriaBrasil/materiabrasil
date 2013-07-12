# == Schema Information
#
# Table name: authorizations
#
#  id         :integer          not null, primary key
#  uid        :string(255)
#  provider   :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Authorization < ActiveRecord::Base

  attr_accessible :provider, :user, :uid
  validates_presence_of :provider
  validates_presence_of :uid
  validates_presence_of :user

  belongs_to :user

end
