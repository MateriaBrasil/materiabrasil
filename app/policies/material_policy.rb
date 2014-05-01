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
    (user.present? && user == @material.manufacturer.user) || user.email == ENV['ADMIN_EMAIL']
  end

  def edit_attachments?
    (user.present? && user == @material.manufacturer.user) || user.email == ENV['ADMIN_EMAIL']
  end

  def update?
    (user.present? && user == @material.manufacturer.user) || user.email == ENV['ADMIN_EMAIL']
  end

  def update_categories?
    (user.present? && user == @material.manufacturer.user) || user.email == ENV['ADMIN_EMAIL']
  end

  def update_attachments?
    (user.present? && user == @material.manufacturer.user) || user.email == ENV['ADMIN_EMAIL']
  end

  def show?
    @material.published? || ((@material.draft && (@material.user == user && user.present?)) || user.email == ENV['ADMIN_EMAIL'])
  end
end
