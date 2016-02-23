class LandingsController < ApplicationController
  before_action :require_user
  helper LandingsHelper

  def index
    @user = params[:user_id].present? ? User.find_by(id: params[:user_id]) : current_user
    @tweets = Kaminari.paginate_array(
      Tweet.related_tweets(@user.id)
    ).page(params[:page]).per(6)
  end
end
