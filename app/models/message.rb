class Message < ApplicationRecord
  BOTH_ACCESS     = :both
  RECEIVER_ACCESS = :receiver
  SENDER_ACCESS   = :sender

  belongs_to :dialog
  belongs_to :user

  scope :for_dialog,       ->(dialog) { MessagesQuery.new.for_dialog(dialog) }
  scope :received_by,      ->(user) { MessagesQuery.new.received_by(user) }
  scope :new_received_for, ->(user) { MessagesQuery.new.new_received_for(user) }

  enum access: [BOTH_ACCESS, SENDER_ACCESS, RECEIVER_ACCESS]
end
