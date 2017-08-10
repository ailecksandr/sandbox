class DialogPolicy < ApplicationPolicy
  def new?
    !user.blocked?
  end

  def send_message?
    !record.decorate(context: { current_user: user }).opposite_user.blocked?
  end
end