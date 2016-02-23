class UserAvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'png'

  version :large do
    eager
    resize_to_fit(256, 256)
  end

  version :related_preview do
    eager
    resize_to_fit(96, 96)
  end

  version :thumbnail do
    eager
    resize_to_fit(48, 48)
  end
end
