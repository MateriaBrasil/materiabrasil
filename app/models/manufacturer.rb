# == Schema Information
#
# Table name: manufacturers
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  site           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  address        :string(255)
#  email          :string(255)
#  cnpj           :string(255)
#  razao_social   :string(255)
#  insc_estadual  :string(255)
#  insc_municipal :string(255)
#  city           :string(255)
#  state          :string(255)
#  cep            :string(255)
#  country        :string(255)
#  mail_address   :string(255)
#  certifications :string(255)
#  user_id        :integer
#  phone          :string(255)
#  image          :string(255)
#  description    :text
#  forum          :boolean
#  forum_mail     :string(255)
#

class Manufacturer < ActiveRecord::Base

  validates_presence_of :name, :description, :site, :razao_social, :cnpj, :address, :cep, :state, :country, :phone, :city

  belongs_to :user
  has_many :contacts
  has_many :materials

  accepts_nested_attributes_for :contacts

  mount_uploader :image, ManufacturerImageUploader
end
