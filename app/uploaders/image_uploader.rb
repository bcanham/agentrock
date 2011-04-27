# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :grid_fs
  grid_fs_host "localhost"
  grid_fs_database "agentrock_images"
  grid_fs_access_url "/profile/images"

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    nil
  end
  
  def cache_dir
    "#{Rails.root}/tmp/cache"
  end

  process :fix_exif_rotation
  process :strip
  # process :resize_to_fill => [1024, 768]
  process :quality => 100 # Percentage from 0 - 100

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  version :large do
    process :resize_to_limit => [250, 250]
  end

  # Add a white list of extensions which are allowed to be uploaded,
  # for images you might use something like this:
      def extension_white_list
        %w(jpg jpeg gif png)
      end

  # Provide a default URL as a default if there hasn't been a file uploaded
  def default_url
    "/public/images/fallback/" + [model.name, "default.png"].compact.join('_')
  end

  # Override the filename of the uploaded files
      # def filename
      #   "#{Rails.root}/public/images/something.jpg" if original_filename
      # end

end
