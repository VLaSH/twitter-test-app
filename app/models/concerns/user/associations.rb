module User::Associations
  extend ActiveSupport::Concern

  included do
    has_many :followers, class_name: 'RelatedUser::Follower'
    has_many :favourite_users, class_name: 'RelatedUser::Favourite'
    has_many :tweets
    has_many :favourite_tweets, class_name: 'InteractedTweet::Favourite'
    has_many :liked_tweets, class_name: 'InteractedTweet::Liked'
    has_many :social_accounts
    has_many :comments
  end
end
