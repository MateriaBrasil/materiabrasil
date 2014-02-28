# coding: utf-8
class ManufacturersController < ApplicationController
  inherit_resources

  def edit
    authorize resource
    @manufacturer.contacts.build unless @manufacturer.contacts.any?
    edit!
  end

  def update
    authorize resource
    update!(notice: 'Informações atualizadas com sucesso!') { material_path(@manufacturer.materials.order('created_at desc').first) }
  end
end

