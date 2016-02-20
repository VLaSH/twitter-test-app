class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]
  expose(:user, attributes: :user_attributes)

  def create
    if user.save
      session[:user_id] = user.id
      redirect_to new_session_path
    else
      render :new
    end
  end

  def update
    if user.save
      redirect_to landings_path
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end

  private

  def user_attributes
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
