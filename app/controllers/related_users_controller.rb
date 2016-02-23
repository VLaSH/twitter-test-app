class RelatedUsersController < ApplicationController
  before_action :require_user

  def index
    @subjects = @current_user.following_users.by_name(
      params[:name]
    ).page(params[:page]).per(5)
  end

  def create
    @subject = related_user_constant&.create(
      user: current_user, related_id: params[:related_id]
    )

    render status: :unprocessable_entity unless @subject&.id
  end

  def destroy
    related_user_constant&.find_by(
      user: current_user, related_id: params[:related_id]
    )&.destroy
  end

  private

  def related_user_constant
    @related_user_constant ||= params[:related_user]&.safe_constantize
  end
end
