source 'https://rubygems.org'

gem 'rails', '~> 3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'taps'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

gem 'heroku'

# File updloadin
gem 'carrierwave'
gem 'fog'
gem "rmagick", :require => 'RMagick'

# Utilities
gem 'simple_form'
#gem 'activeadmin', :git => 'git://github.com/gregbell/active_admin.git'
gem 'activeadmin', :git => "git@github.com:MateriaBrasil/active_admin.git", :branch => "dsl_form_builder"
gem 'devise', '1.5.3'
gem 'compass-rails'
gem 'compass-960-plugin'
gem 'sass-rails'
gem 'slim'
gem 'meta_search',    '>= 1.1.0.pre'

# Database
gem 'acts_as_tree_rails3'


# Cache
gem 'dalli'


group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'shoulda-matchers'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'database_cleaner'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


