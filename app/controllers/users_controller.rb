class UsersController < ApplicationController
  def index
    authorize User

    @users = User::Index.(current_user: current_user, query: params[:query])

    render json: @users
  end
end
