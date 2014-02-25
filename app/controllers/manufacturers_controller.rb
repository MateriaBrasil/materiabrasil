class ManufacturersController < ApplicationController
  inherit_resources

  def edit
    authorize resource
    edit!
  end

  def update
    authorize resource
    update!(notice: 'Material criado com sucesso!') { material_path(@manufacturer.materials.order('created_at desc').first) }
  end
end

