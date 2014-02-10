class ManufacturerPolicy < ApplicationPolicy
  def initialize(user, manufacturer)
    @user = user
    @manufacturer = manufacturer
  end

  def edit?
    user == @manufacturer.user
  end

  def update?
    user == @manufacturer.user
  end
end
