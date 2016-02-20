class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :body, presence: true, length: { maximum: 100 }
end
