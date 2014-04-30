CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

unless Rails.env.production?
  ENV['ADMIN_EMAIL'] = CONFIG['ADMIN_EMAIL']
end