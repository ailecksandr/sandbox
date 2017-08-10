class HomeController < ApplicationController
  def index
    return render 'guest' unless user_signed_in?

    @new_messages_count = current_user.decorate.unread_messages_count
  end
end
