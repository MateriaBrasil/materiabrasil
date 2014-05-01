class ManufacturerPolicy < ApplicationPolicy
  def initialize(user, manufacturer)
    @user = user
    @manufacturer = manufacturer
  end

  def edit?
    user.present? && (user == @manufacturer.user || user.email = ENV['ADMIN_EMAIL'])
  end

  def update?
    user.present? && (user == @manufacturer.user || user.email = ENV['ADMIN_EMAIL'])
  end
end
