class InteractedTweet::Favourite < InteractedTweet
  after_create :write_tweet

  def self.by_user_and_tweet(user, tweet)
    find_by(user_id: user, tweet_id: tweet)
  end

  private

  def write_tweet
    Tweet.find_by(id: tweet_id).update(interacted_at: Time.zone.now)
  end
end
