class ManufacturersController < ApplicationController
  inherit_resources

  def edit
    authorize resource
    edit!
  end

  def update
    authorize resource
    update!(notice: 'Material criado com sucesso!') { root_url }
  end
end

