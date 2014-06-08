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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Image < ActiveRecord::Base

  belongs_to :material
  after_initialize :default_values
  scope :featured_first, order("featured DESC")

  mount_uploader :image, ImageUploader

private
  def default_values
    self.featured ||= false
  end
end
