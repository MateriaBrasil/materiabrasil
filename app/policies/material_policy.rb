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
    user == @material.manufacturer.user || user.email = 'contato@materiabrasil.net'
  end

  def edit_attachments?
    user == @material.manufacturer.user || user.email = 'contato@materiabrasil.net'
  end

  def update?
    user == @material.manufacturer.user || user.email = 'contato@materiabrasil.net'
  end

  def update_categories?
    user == @material.manufacturer.user || user.email = 'contato@materiabrasil.net'
  end

  def update_attachments?
    user == @material.manufacturer.user || user.email = 'contato@materiabrasil.net'
  end

  def show?
    @material.published? || ((@material.draft && @material.user == user) || user.email = 'contato@materiabrasil.net')
  end
end
