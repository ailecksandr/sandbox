class MessagesQuery < ApplicationQuery::Base
  def for_dialog(dialog)
    with_user(dialog.messages).order(:created_at)
  end

  def received_by(user)
    relation.where.not(user: user).where("dialogs.creator_id = #{user.id} OR dialogs.companion_id = #{user.id}")
  end

  def new_received_for(user)
    with_dialog(relation).received_by(user).where(read: false)
  end

  private

  def with_user(scope)
    scope.includes(user: :profile).references(user: :profile)
  end

  def with_dialog(scope)
    scope.includes(:dialog).references(:dialog)
  end
end
