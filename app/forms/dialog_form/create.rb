module DialogForm
  class Create < ApplicationForm::Base
    property :creator_id
    property :companion_id

    validates :creator_id, :companion_id, presence: true

    validate :not_same_user?

    private

    def not_same_user?
      errors.add(:base, t('activerecord.errors.models.dialog.messages.same_users')) if creator_id == companion_id
    end
  end
end
