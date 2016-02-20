class User < ActiveRecord::Base
  include User::Associations
  include User::Methods
  has_secure_password

  validates :first_name, :last_name, presence: true, length: { maximum: 35 }
  validates :email, presence: true, length: { maximum: 55 }, uniqueness: true
  validates :password, presence: true, length: { in: 8..16 }

  accepts_nested_attributes_for :social_accounts
end
