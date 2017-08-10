class Dialog < ApplicationRecord
  belongs_to :creator,   class_name: 'User'
  belongs_to :companion, class_name: 'User'

  has_many :messages, dependent: :destroy

  scope :for_user,     ->(user) { DialogsQuery.new.for_user(user) }
  scope :search,       ->(user) { DialogsQuery.new.search(user) }
  scope :conversation, ->(current_user, opposite_user) { DialogsQuery.new.conversation(current_user, opposite_user) }
end
