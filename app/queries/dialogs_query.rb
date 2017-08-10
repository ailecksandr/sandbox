class DialogsQuery < ApplicationQuery::Base
  def for_user(user)
    relation.where(creator: user).or(relation.where(companion: user))
  end

  def search(user)
    with_messages(with_communicators(for_user(user))).order(updated_at: :desc)
  end

  def conversation(user, opposite_user)
    relation.where(creator: user, companion: opposite_user)
      .or(relation.where(creator: opposite_user, companion: user)).first || new_dialog(user, opposite_user)
  end

  private

  def with_communicators(scope)
    scope.includes(creator: :profile, companion: :profile).references(creator: :profile, companion: :profile)
  end

  def with_messages(scope)
    scope.includes(:messages).references(:messages)
  end

  def new_dialog(user, opposite_user)
    form = DialogForm::Create.new(Dialog.new(creator: user, companion: opposite_user))

    return unless form.valid?

    form.save
    form.model
  end
end
