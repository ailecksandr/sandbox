class Dialog
  class Show < ::ApplicationService::Base
    include ActionView::Helpers::DateHelper

    def initialize(params = {})
      @current_user_id  = params[:current_user_id]
      @opposite_user_id = params[:opposite_user_id]
      @serialize        = params[:serialize]
    end

    def call
      prepare!

      mark_as_read!

      return mapped_dialog.to_json.html_safe if serialize

      mapped_dialog
    end

    private

    attr_reader :current_user_id, :opposite_user_id, :serialize, :serialized_messages

    def mark_as_read!
      messages.new_received_for(current_user).update(read: true)
    end

    def mapped_dialog
      @mapped_dialog = {
        id:                    dialog.id,
        messages:              serialized_messages,
        user_id:               dialog.opposite_user_id,
        user_nickname:         dialog.opposite_user_nickname,
        is_online:             dialog.opposite_user_online?,
        unread_messages_count: current_user.decorate.unread_messages_count,
        disable_reason:        disable_reason
      }
    end

    def dialog
      Dialog.conversation(current_user, opposite_user).decorate(context: { current_user: current_user })
    end

    def messages
      @messages ||= Message.for_dialog(dialog)
    end

    def prepare!
      @serialized_messages = ActiveModelSerializers::SerializableResource
        .new(messages, each_serializer: MessageSerializer, scope: { current_user: current_user }).as_json
    end

    def current_user
      @current_user ||= User.find(current_user_id).decorate
    end

    def opposite_user
      @opposite_user ||= User.find(opposite_user_id)
    end

    def disable_reason
      return I18n.t('dialogs.new.disable_reasons.blocked') unless MessagePolicy.new(current_user, Message).create?

      I18n.t('dialogs.new.disable_reasons.companion_blocked') unless DialogPolicy.new(current_user, dialog).send_message?
    end
  end
end
