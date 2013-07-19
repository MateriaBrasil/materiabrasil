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
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :city, :email, :password, :password_confirmation, :remember_me, :newsletter
  validates :email, :name, presence: true

  has_many :authorizations, dependent: :destroy

  def self.create_with_omniauth(auth)
    u = create! do |user|
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      pass = Devise.friendly_token[0,20]
      user.password = pass
      user.password_confirmation = pass
      user.city = auth['info']['location']
    end
    u.authorizations.create! uid: auth['uid'], provider: 'facebook', user: u
    u
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session[:omniauth]
        user.email = auth.info.email if auth.info.email.present?
        user.name = auth.info.name
        user.city = auth.info.location
        user.authorizations.build(provider: auth.provider, uid: auth.uid)
      end
    end
  end

  def picture
    @image ||= "https://graph.facebook.com/#{self.authorizations.first.uid}/picture?type=square" if authorizations.size > 0
  end
end
