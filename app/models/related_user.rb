class RelatedUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :related, class_name: 'User'
end
