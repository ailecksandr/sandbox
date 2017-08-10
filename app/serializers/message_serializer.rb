class MessageSerializer < ActiveModel::Serializer
  attributes :body
  attributes :sent_at
  attributes :message_class
  attributes :read_class

  belongs_to :user, serializer: UserSerializer

  delegate :decorate, to: :object

  def sent_at
    decorate.sent_at
  end

  def message_class
    decorate(context: scope).message_class
  end

  def read_class
    decorate.read_class
  end
end