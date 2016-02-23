class EmailConfirmationsController < ApplicationController
  before_action :only_guests

  def confirm
    @user = User.find_by(id: params[:email_confirmation_id])
    if @user.update(email_confirmed: true)
      redirect_to new_session_path
    else
      redirect_to new_user_path
    end
  end
end
