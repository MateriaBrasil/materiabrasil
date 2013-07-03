class Authorization < ActiveRecord::Base

  attr_accessible :provider, :user, :uid
  validates_presence_of :provider
  validates_presence_of :uid
  validates_presence_of :user

  belongs_to :user

end
