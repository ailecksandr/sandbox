class RegistrationsController < Devise::RegistrationsController
  helper_method :profile

  before_action :authenticate_user!, only: %i[change_password edit]

  def change_password
    authorize User

    @user = Devise::Registrations::ChangePassword.(model: current_user.decorate, params: password_params)

    return render 'devise/registrations/edit' if @user.errors.any?

    bypass_sign_in @user.model

    redirect_to edit_user_registration_path, notice: t('devise.registrations.password_changed')
  end

  protected

  def build_resource(params = nil)
    self.resource = Devise::Registrations::ResourceBuilder.(params: params, resource: self.resource)
  end

  def after_sign_up_path_for(*)
    root_path
  end

  private

  def profile
    @profile ||= ProfileForm::Update.new(ProfileDecorator.decorate(resource.profile))
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: %i[nickname])
  end

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
