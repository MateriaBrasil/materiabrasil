class Image < ActiveRecord::Base

  belongs_to :material
  validates_presence_of :title

  mount_uploader :image, ImageUploader
end
