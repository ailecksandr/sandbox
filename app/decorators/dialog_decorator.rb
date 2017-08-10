class DialogDecorator < ApplicationDecorator
  delegate_all

  delegate :id, :email, :name, :phone, :email, :avatar_file_name, :avatar_url, :nickname, :online?,
                to: :opposite_user, prefix: true

  def opposite_user
    UserDecorator.decorate(take_opposite_user)
  end

  private

  def take_opposite_user
    context[:current_user] == creator ? companion : creator
  end
end
