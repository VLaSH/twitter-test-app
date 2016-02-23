class Users::ProfilesController < ApplicationController
  def update
    @user_profile = User::Profile.find_by(user_id: params[:user_id])
    if @user_profile.update(user_profile_params)
      respond_with_bip(@user_profile)
    else
      render status: :unprocessable_entity
    end
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(
      :gender, :date_of_birth, :school, :website, :hobby, :status
    )
  end
end
