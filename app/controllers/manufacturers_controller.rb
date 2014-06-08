# coding: utf-8
class ManufacturersController < ApplicationController
  inherit_resources

  def show
    @contacts = (current_user and (resource.user == current_user || current_user.email == ENV['ADMIN_EMAIL'])) ? resource.contacts : resource.contacts.publics
    @materials = (current_user and (resource.user == current_user || current_user.email == ENV['ADMIN_EMAIL'])) ? resource.materials : resource.materials.approved
  end

  def edit
    authorize resource
    @manufacturer.contacts.build unless @manufacturer.contacts.any?
    edit!
  end

  def update
    authorize resource
    update!(notice: 'Informações atualizadas com sucesso!') { manufacturer_path(@manufacturer) }
  end
end