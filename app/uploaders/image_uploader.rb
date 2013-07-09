# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{mounted_as}_#{model.id}"
  end

  process :resize_to_fill => [800, 600]
 
  version :longflat, from: :main do 
    process :resize_to_fill => [580, 240]
  end

  version :flat, from: :main do
    process :resize_to_fill => [280, 240]
  end

  version :tall, from: :main do
    process :resize_to_fill => [280, 480]
  end
  
  version :largetall, from: :main do
    process :resize_to_fill => [490, 485]
  end

  version :main do
    process :resize_to_fill => [800,600]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
     "http://i.imgur.com/Qw7bJ.jpg"
  end

  # Process files as they are uploaded:
  # Create different versions of your uploaded files:

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    if original_filename 
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end
end
