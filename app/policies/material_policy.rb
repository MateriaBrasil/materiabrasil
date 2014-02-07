class MaterialPolicy < ApplicationPolicy
  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit_attachments?
    user.present?
  end

  def update?
    user.present?
  end

  def update_categories?
    user.present?
  end

  def update_attachments?
    user.present?
  end
end
