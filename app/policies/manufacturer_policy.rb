class ManufacturerPolicy < ApplicationPolicy
  def initialize(user, manufacturer)
    @user = user
    @manufacturer = manufacturer
  end

  def edit?
    user == @manufacturer.user || user.email = ENV['ADMIN_EMAIL']
  end

  def update?
    user == @manufacturer.user || user.email = ENV['ADMIN_EMAIL']
  end
end
