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
    user == @material.manufacturer.user
  end

  def edit_attachments?
    user == @material.manufacturer.user
  end

  def update?
    user == @material.manufacturer.user
  end

  def update_categories?
    user == @material.manufacturer.user
  end

  def update_attachments?
    user == @material.manufacturer.user
  end
end
