# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#  city       :string(255)
#  state      :string(255)
#

class User < ActiveRecord::Base
  validates :email, :name, presence: true 

  has_many :authorizations, dependent: :destroy
 
  def self.create_from_auth_hash(hash)
    create!(
      :email => hash['info']['email'],
      :name  => hash['info']['name'],
      :city  => hash['info']['location']
    )
  end

  def picture
    @image ||= "https://graph.facebook.com/#{self.authorizations.first.uid}/picture?type=square"
  end
end
