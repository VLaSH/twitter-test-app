class Users::SocialAccountsController < ApplicationController
  before_action :require_user

  def create
    @user = User.from_omniauth(auth_params)
    if @user.save
      redirect_to landings_path
    else
      redirect_to new_session_path
    end
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end
end
