# coding: utf-8
class ImagesController < ApplicationController
  inherit_resources
  belongs_to :material
  def destroy
    destroy! { material_edit_attachments_path parent }
  end
end

