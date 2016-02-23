class RestorePasswordsController < ApplicationController
  before_action :only_guests
  
  def create
    @user = User.find_by(email: params[:user][:email])

    redirect_to new_user_path unless @user&.restore_password
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update(password: params[:user][:password])
      redirect_to new_session_path
    else
      redirect_to new_user_path
    end
  end

  def restore
  end
end
