class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    return redirect_to new_user_session_path unless user.persisted?

    sign_in user

    redirect_to root_url
  end


  private

  def response
    request.env['omniauth.auth']
  end

  def user
    @user ||= Devise::OmniauthCallbacks::Linkedin.(response)
  end
end
