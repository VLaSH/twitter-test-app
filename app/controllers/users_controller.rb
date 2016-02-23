class UsersController < ApplicationController
  respond_to :js, :html
  before_action :only_guests, only: [:new, :create]
  before_action :require_user, except: [:new, :create]
  expose(:user, attributes: :user_attributes)

  def index
    @users = User.by_name(params[:name]).page(params[:page]).per(5)
  end

  def create
    if user.save
      session[:user_id] = user.id
      user.send_email_confirmation
      redirect_to new_session_path
    else
      render :new
    end
  end

  def update
    user.save

    respond_to do |f|
      f.json { respond_with_bip(user) }
      f.html { redirect_to landings_path }
    end
  end

  def destroy
    user.destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end

  private

  def user_attributes
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end
