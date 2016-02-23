class TweetsController < ApplicationController
  before_action :require_user
  expose(:tweets)
  expose(:tweet, attributes: :tweet_attributes)

  def create
    @tweet = Tweet.create(tweet_attributes.merge(user: current_user))
    render status: :unprocessable_entity unless @tweet.id
  end

  def update
    tweet.save

    respond_with_bip(tweet)
  end

  def destroy
    tweet.destroy
  end

  private

  def tweet_attributes
    params.require(:tweet).permit(:body)
  end
end
