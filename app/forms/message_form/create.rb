module MessageForm
  class Create < ApplicationForm::Base
    property :dialog_id
    property :user_id
    property :body

    validates :dialog_id, :user_id, :body, presence: true
  end
end
