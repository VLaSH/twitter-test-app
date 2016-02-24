class SessionsController < ApplicationController
  before_action :only_guests, except: :destroy

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user&.authenticate(params[:session][:password]) && @user.email_confirmed
      session[:user_id] = @user.id
      redirect_to landings_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
end
