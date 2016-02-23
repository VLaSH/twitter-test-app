module UserAssociations
  extend ActiveSupport::Concern

  included do
    has_many :related_users, dependent: :destroy
    has_many :following_users, -> { where('related_users.type = ?', 'RelatedUser::Follower') },
             class_name: 'User', through: :related_users, source: :related, dependent: :destroy
    has_many :favourite_users, -> { where('related_users.type = ?', 'RelatedUser::Favourite') },
             class_name: 'User', through: :related_users, source: :related, dependent: :destroy
    has_many :interacted_tweets, dependent: :destroy
    has_many :liked_tweets, -> { where('interacted_tweets.type = ?', 'InteractedTweet::Liked') },
             class_name: 'Tweet', through: :interacted_tweets, source: :tweet, dependent: :destroy
    has_many :favourite_tweets, -> { where('interacted_tweets.type = ?', 'InteractedTweet::Favourite') },
             class_name: 'Tweet', through: :interacted_tweets, source: :tweet, dependent: :destroy
    has_many :tweets, dependent: :destroy
    has_many :social_accounts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_one :profile, dependent: :destroy

    delegate :by_user_and_tweet, to: :liked_tweets
  end
end
