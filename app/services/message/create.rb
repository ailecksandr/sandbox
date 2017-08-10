class Message
  class Create < ::ApplicationService::FormService
    form_class MessageForm::Create

    def call
      Message.transaction do
        super

        update_dialog!
      end

      form
    end

    private

    def update_dialog!
      dialog.touch(:updated_at)
    end

    def dialog
      @dialog ||= Dialog.find(params[:dialog_id])
    end
  end
end
