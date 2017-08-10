class ProfilesController < ApplicationController
  helper_method :resource, :profile

  before_action :authenticate_user!

  def update
    authorize Profile

    @profile = Profile::Update.(model: profile, params: profile_params)

    return redirect_to edit_user_registration_path, notice: t('profiles.update.success') unless profile.errors.any?

    flash.now[:danger] = profile.errors

    render 'devise/registrations/edit'
  end

  private

  def resource
    @user ||= current_user
  end

  def profile
    @profile ||= Profile.find(params[:id]).decorate
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :nickname, :phone, :avatar)
  end
end
