class Comment < ActiveRecord::Base
  paginates_per 5
  belongs_to :tweet
  belongs_to :user
end
