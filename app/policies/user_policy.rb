class UserPolicy < ApplicationPolicy
  def edit?
    !user.blocked?
  end

  def index?
    !user.blocked?
  end

  def change_password?
    index?
  end
end
