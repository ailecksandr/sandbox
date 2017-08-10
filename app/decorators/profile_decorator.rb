class ProfileDecorator < ApplicationDecorator
  delegate_all

  delegate :url, to: :avatar, prefix: true, allow_nil: true
end
