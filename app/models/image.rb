class Image < ActiveRecord::Base
  validates_presence_of :image
  validates_presence_of :title
  validates_presence_of :material_id

  belongs_to :material

  mount_uploader :image, ImageUploader
end
