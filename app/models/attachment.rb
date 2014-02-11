# == Schema Information
#
# Table name: attachments
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  file        :string(255)
#  material_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Attachment < ActiveRecord::Base
  attr_accessible :file, :material_id, :name
  belongs_to :material
  before_save :check_name
  mount_uploader :file, FileUploader

  def check_name
    return false if name.blank?
  end
end
