class Users::SocialAccountsController < ApplicationController
  def create
    @user = User.from_omniauth(auth_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to landings_path
    else
      redirect_to new_session_path
    end
  end

  private

  def auth_params
    auth = request.env['omniauth.auth']
    {
      first_name: auth['info']['name'].split(' ').first,
      last_name: auth['info']['name'].split(' ').last,
      email: auth['info']['email'],
      social_accounts_attributes: {
        provider: auth['provider'],
        uid: auth['uid'],
        avatar: auth['info']['image']
      }
    }
  end
end
