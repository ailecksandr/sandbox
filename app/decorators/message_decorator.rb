class MessageDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper

  delegate_all

  delegate :user,     to: :model, prefix: true, allow_nil: true
  delegate :nickname, to: :user,  prefix: true, allow_nil: true

  def user
    model.user.decorate
  end

  def sent_at
    return I18n.t('time.ago', time: time_ago_in_words(created_at)) if created_at > 1.day.ago

    I18n.l(created_at, format: :human_time)
  end

  def message_class
    context[:current_user] == user ? 'sent' : 'received'
  end

  def read_class
    read ? 'read' : 'unread'
  end
end
