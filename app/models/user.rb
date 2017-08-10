class User < ApplicationRecord
  include User::DeviseSettings::Callbacks

  USER_ROLE    = :user
  ADMIN_ROLE   = :admin
  BLOCKED_ROLE = :blocked

  has_one :profile, dependent: :destroy, inverse_of: :user
  has_many :created_dialogs,  foreign_key: :creator_id,   class_name: 'Dialog'
  has_many :assigned_dialogs, foreign_key: :companion_id, class_name: 'Dialog'
  has_many :created_messages, class_name: 'Message'

  accepts_nested_attributes_for :profile

  scope :confirmed,   -> { UsersQuery.new.confirmed }
  scope :search,      ->(query, user, columns) { UsersQuery.new.search(query, user, columns) }
  scope :except_user, ->(user) { UsersQuery.new.except_user(user) }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable, :omniauthable, :lastseenable

  enum role: [USER_ROLE, ADMIN_ROLE, BLOCKED_ROLE]

  delegate :nickname, to: :profile, allow_nil: true
end
