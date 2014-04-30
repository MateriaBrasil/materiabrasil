class MaterialPolicy < ApplicationPolicy

  def initialize(user, material)
    @user = user
    @material = material
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user == @material.manufacturer.user || user.email = ENV['ADMIN_EMAIL']
  end

  def edit_attachments?
    user == @material.manufacturer.user || user.email = ENV['ADMIN_EMAIL']
  end

  def update?
    user == @material.manufacturer.user || user.email = ENV['ADMIN_EMAIL']
  end

  def update_categories?
    user == @material.manufacturer.user || user.email = ENV['ADMIN_EMAIL']
  end

  def update_attachments?
    user == @material.manufacturer.user || user.email = ENV['ADMIN_EMAIL']
  end

  def show?
    @material.published? || ((@material.draft && @material.user == user) || user.email = ENV['ADMIN_EMAIL'])
  end
end
