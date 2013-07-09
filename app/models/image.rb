# == Schema Information
#
# Table name: images
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  image       :string(255)
#  material_id :integer
#  featured    :boolean
#  use_case    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  render      :boolean
#

class Image < ActiveRecord::Base

  belongs_to :material
  validates_presence_of :title, :image

  mount_uploader :image, ImageUploader
end
