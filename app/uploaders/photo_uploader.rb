class PhotoUploader < CarrierWave::Uploader::Base
include Cloudinary::CarrierWave
    process eager: true  # Force version generation at upload time.

    process convert: 'jpg'

    version :thumbnail do
      resize_to_fill 256, 256
    end

    version :mid_thumbnail do
      resize_to_fill 512, 512
    end

    version :button_thumb do
      resize_to_fill 128, 128
    end
end
