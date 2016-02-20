class InteractedTweetsController < ApplicationController
  before_action :require_user

  def index
    @interacted_tweets = interacted_constant.where(user: current_user)
  end

  def create
    @interacted_tweet = interacted_constant&.create(
      user: current_user, tweet: Tweet.find(params[:tweet_id])
    )

    render status: :unprocessable_entity unless @interacted_tweet&.id
  end

  def destroy
    interacted_constant&.find_by(tweet: params[:tweet_id])&.destroy
  end

  private

  def interacted_constant
    @interacted_constant ||= params[:interact_object]&.safe_constantize
  end
end
