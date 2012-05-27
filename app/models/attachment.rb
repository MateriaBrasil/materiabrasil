class Attachment < ActiveRecord::Base
  attr_accessible :file, :material_id, :name
  belongs_to :material
  mount_uploader :file, FileUploader
end
