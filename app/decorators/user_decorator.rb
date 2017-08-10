class UserDecorator < Draper::Decorator
  delegate_all

  delegate :nickname, :first_name, :last_name, :phone, :avatar, :avatar_file_name, to: :profile, allow_nil: true

  delegate :url, to: :avatar, prefix: true

  def name
    "#{last_name} #{first_name}"
  end

  def online?
    last_seen.present? && last_seen > 5.minutes.ago
  end

  def unread_messages_count
    Message.new_received_for(self).count
  end
end
