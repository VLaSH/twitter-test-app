class User::SocialAccount < ActiveRecord::Base
  enum provider: %i(facebook google twitter)
  belongs_to :user

  validates :uid, uniqueness: true
end
