module LandingsHelper
  SIZES = {
    large: '256',
    medium: '198',
    related_preview: '128',
    small: '96',
    thumbnail: '48'
  }.freeze

  def avatar_link(user, size)
    if user.avatar.present?
      user.avatar.send(size).url
    elsif user.social_accounts.last&.avatar
      "#{user.social_accounts.last.avatar}?width=#{SIZES[size]}&height=#{SIZES[size]}"
    else
      "noavatar_#{SIZES[size]}.png"
    end
  end
end
