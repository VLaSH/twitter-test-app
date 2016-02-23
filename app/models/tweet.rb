class Tweet < ActiveRecord::Base
  include TweetMethods
  paginates_per 7
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :body, presence: true, length: { maximum: 100 }
  before_create :write_tweet
end
