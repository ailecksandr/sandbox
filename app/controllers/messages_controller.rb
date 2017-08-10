class MessagesController < ApplicationController
  def create
    authorize Message

    @message = Message::Create.(
      params: message_params,
      additional: {
        dialog_id: params[:dialog_id],
        user_id:   current_user.id
      }
    )

    return head :internal_server_error if @message.errors.any?

    @message = MessageSerializer.new(@message.model, scope: { current_user: current_user }).to_json.html_safe
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
