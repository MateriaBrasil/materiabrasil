class Authorization < ActiveRecord::Base
  
  attr_accessible :provider, :user, :uid
  validates_presence_of :provider
  validates_presence_of :uid
  validates_presence_of :user

  belongs_to :user


  def self.create_from_auth_hash(hash, user=nil)
    user ||= User.create_from_auth_hash(hash)
    Authorization.create!(user: user, uid: hash['uid'], provider: hash['provider'])
  end
end
