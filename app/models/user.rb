class User < ActiveRecord::Base
  include UserAssociations
  include UserMethods
  has_secure_password
  after_create :create_profile
  mount_uploader :avatar, UserAvatarUploader

  validates :first_name, :last_name, presence: true, length: { maximum: 35 }
  validates :email, presence: true, length: { maximum: 55 }, uniqueness: true
  validates :password_digest, presence: true

  accepts_nested_attributes_for :social_accounts
end
