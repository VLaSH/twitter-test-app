module UserMethods
  extend ActiveSupport::Concern

  def favourites
    favourites = favourite_users + favourite_tweets
    favourites.sort_by(&:created_at).reverse!
  end

  def name
    "#{first_name} #{last_name}"
  end

  def create_profile
    User::Profile.create(user_id: id)
  end

  def follow?(user_id)
    following_users.where(id: user_id).present?
  end

  def favourite?(user_id)
    favourite_users.where(id: user_id).present?
  end

  def send_email_confirmation
    UserMailer.confirm_email(self).deliver_later
  end

  def restore_password
    UserMailer.restore_password(self).deliver_later
  end

  class_methods do
    def from_omniauth(auth_params)
      user = find_or_initialize_by(email: auth_params[:email])
      %i(first_name last_name avatar).each do |attr|
        user[attr] ||= auth_params[attr]
      end
      user.password = Digest::SHA1.hexdigest(auth_params[:email])[1..16]
      user.assign_attributes(
        social_accounts_attributes: [
          auth_params[:social_accounts_attributes]
        ]) unless user.id
      user
    end

    def by_name(name)
      where('first_name ILIKE :name OR last_name ILIKE :name', name: "%#{name}%")
    end
  end
end
