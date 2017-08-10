class Dialog
  class Index < ::ApplicationService::Base
    def initialize(params = {})
      @current_user = params[:current_user]
      @query        = params[:query]
    end

    def call
      mapped_dialogs.select { |user| compare(user) }.take(SEARCH_COUNT)
    end

    private

    SEARCH_COLUMNS = %i[nickname name phone email].freeze
    SEARCH_COUNT   = 10

    attr_reader :current_user, :query

    def mapped_dialogs
      dialogs.map do |dialog|
        {
          id:               dialog.opposite_user_id,
          dialog_id:        dialog.id,
          nickname:         dialog.opposite_user_nickname,
          name:             dialog.opposite_user_name,
          phone:            dialog.opposite_user_phone,
          email:            dialog.opposite_user_email,
          is_online:        dialog.opposite_user_online?,
          avatar_file_name: dialog.opposite_user_avatar_file_name,
          avatar_url:       dialog.opposite_user_avatar_url,
          unread_messages:  dialog.messages.new_received_for(current_user).count
        }
      end
    end

    def dialogs
      DialogDecorator.decorate_collection(dialogs_for_user, context: { current_user: current_user })
    end

    def dialogs_for_user
      Dialog.search(current_user)
    end

    def compare(user)
      SEARCH_COLUMNS.any? { |column| user[column].to_s.downcase =~ /#{query.to_s.downcase}/ }
    end
  end
end
