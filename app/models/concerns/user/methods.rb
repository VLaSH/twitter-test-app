module User::Methods
  extend ActiveSupport::Concern

  def followers_and_user
    User.where(id: follower_ids << id)
  end

  class_methods do
    def from_omniauth(auth_params)
      user = find_or_initialize_by(email: auth_params[:email])
      %i(first_name last_name avatar).each do |attr|
        user[attr] ||= auth_params[attr]
      end
      user.password = Digest::SHA1.hexdigest(auth_params[:email])[1..16]
      user.assign_attributes(social_accounts_attributes: [auth_params[:social_accounts_attributes]])
      user
    end
  end
end
