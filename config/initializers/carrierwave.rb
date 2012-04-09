CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                         # required
    :aws_access_key_id      => ENV['AMAZON_S3_KEY'],          # required
    :aws_secret_access_key  => ENV['AMAZON_S3_SECRET'],       # required
  }
  config.fog_directory  = 'materiabrasil'                         # required
  config.fog_host       = 'https://assets.materiabrasil.com'      # optional, defaults to nil
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
