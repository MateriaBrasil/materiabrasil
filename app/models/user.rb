class User < ActiveRecord::Base
  validates :email, :name, presence: true 
  validates :city, presence: true, allow_blank: true

  has_many :authorizations, dependent: :destroy
 
  def self.create_from_auth_hash(hash)
    create!(
      :email => hash['info']['email'],
      :name  => "#{hash['info']['first_name']} #{hash['info']['last_name']}",
      :city  => hash['info']['location']
    )
  end

  def picture
    @image ||= "https://graph.facebook.com/#{self.authorizations.first.uid}/picture?type=square"
  end
end
