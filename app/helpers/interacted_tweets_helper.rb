module InteractedTweetsHelper
  def any_liked_tweets?(user_id, tweet_id)
    InteractedTweet::Liked.by_user_and_tweet(
      user_id, tweet_id
    ).present?
  end

  def any_favourite_tweets?(user_id, tweet_id)
    InteractedTweet::Favourite.by_user_and_tweet(
      user_id, tweet_id
    ).present?
  end
end
