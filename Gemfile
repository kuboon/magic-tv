source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

gem "exception_notification"
gem 'sorcery'
gem "cancan", :git => "git://github.com/ryanb/cancan.git", :branch => "2.0"
gem "haml-rails"
gem "simple_form"
gem "kaminari"
gem "action_args"
gem "strong_parameters"
gem "factory_girl_rails"
gem "feed-normalizer"

group :assets do
  gem "twitter-bootstrap-rails"
  gem "jquery-ui-rails"
end

group :development do
  gem "i18n_generators", git: 'git://github.com/amatsuda/i18n_generators.git'
  gem "better_errors"
  gem "binding_of_caller"
  gem "meta_request"
end

group :development, :test do
  gem "rspec-rails"
  gem "webrat"
  gem "pry-rails"
  gem 'sqlite3'
  gem "spring"
end

gem "delayed_job_active_record"
gem "acts-as-taggable-on"
gem "omniauth-twitter"
gem "omniauth-facebook"
gem "omniauth-openid"
