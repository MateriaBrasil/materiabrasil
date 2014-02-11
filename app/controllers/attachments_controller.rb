# coding: utf-8
class AttachmentsController < ApplicationController
  inherit_resources
  belongs_to :material
  def destroy
    destroy! { material_edit_attachments_path parent }
  end
end

