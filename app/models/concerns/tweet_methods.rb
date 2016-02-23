module TweetMethods
  extend ActiveSupport::Concern

  def liked_count
    InteractedTweet::Liked.where(tweet_id: id).count
  end

  def favourite_count
    InteractedTweet::Favourite.where(tweet_id: id).count
  end

  class_methods do
    def related_tweets(user_id)
      find_by_sql ["SELECT distinct tweets.* FROM tweets LEFT JOIN interacted_tweets ON
                   interacted_tweets.tweet_id = tweets.id where (interacted_tweets.type = 'InteractedTweet::Favourite' and
                   interacted_tweets.user_id = :f) or tweets.user_id = :f ORDER BY tweets.interacted_at DESC", f: user_id]
    end
  end

  private

  def write_tweet
    self.interacted_at = Time.zone.now
  end
end
