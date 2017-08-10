class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :no_access!

  private

  def no_access!
    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
