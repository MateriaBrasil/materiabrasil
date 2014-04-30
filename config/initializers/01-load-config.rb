unless Rails.env.production?
  CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
  ENV['ADMIN_EMAIL'] = CONFIG['ADMIN_EMAIL']
end