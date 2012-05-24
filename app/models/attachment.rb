class Attachment < ActiveRecord::Base
  attr_accessible :file, :material_id, :name
end
