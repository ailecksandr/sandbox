class DialogsController < ApplicationController
  before_action :authenticate_user!

  def new
    authorize Dialog
  end

  def index
    @users = Dialog::Index.(current_user: current_user, query: params[:query])

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @dialog = Dialog::Show.(
      current_user_id:  current_user.id,
      opposite_user_id: params[:id]
    )

    render json: @dialog
  end

  def create
    @dialog = Dialog::Show.(
      current_user_id:  dialog_params[:creator_id],
      opposite_user_id: dialog_params[:companion_id],
      serialize:        true
    )
  end

  private

  def dialog_params
    params.require(:dialog).permit(:creator_id, :companion_id)
  end
end
