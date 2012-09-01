class User < ActiveRecord::Base
  validates :email, :name, :city, presence: true 

  has_many :authorizations
 
  def self.create_from_auth_hash(hash)
    create!(
      email:  hash['info']['email'],
      name:   hash['info']['name'], 
      city:   hash['info']['location']
    )
  end

end
