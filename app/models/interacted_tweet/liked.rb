class InteractedTweet::Liked < InteractedTweet
  def self.by_user_and_tweet(user, tweet)
    find_by(user_id: user, tweet_id: tweet)
  end
end
