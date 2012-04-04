source 'https://rubygems.org'

gem "rails",                  "3.2.2"

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "carrierwave",            "~> 0.6.0" # Upload files in your Ruby applications, map them to a range of ORMs, store them on different backends
gem "capistrano",             "~> 2.11.2"
gem "devise",                 "~> 2.0.4" # Flexible authentication solution for Rails with Warden
gem "fog",                    "~> 1.3.1" # The Ruby cloud services library.
gem "formtastic",             "~> 2.1.1"
gem 'formtastic-bootstrap',
  :git => 'https://github.com/cgunther/formtastic-bootstrap.git',  # Since formtastic-bootstrap is not (yet) Rails 3.2.x ready.
  :branch => 'bootstrap2-rails3-2-formtastic-2-1' # See http://blog.sam-pointer.com/2012/02/12/formtastic-bootstrap-with-rails-3-2-and-twitter-bootstrap-2
gem "haml",                   "~> 3.1.4"
gem "jquery-rails",           "~> 2.0.1"
gem "mysql2",                 "~> 0.3.11"
gem "settingslogic",          "~> 2.0.8" # A simple and straightforward settings solution that uses an ERB enabled YAML file and a singleton design pattern.

group :development do
  gem "haml-rails",           "~> 0.3.4"
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "coffee-rails",         "~> 3.2.1"
  gem "bootstrap-sass",       "~> 2.0.2"
  gem "sass-rails",           "~> 3.2.3"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # You don't need this if you already have nodejs installed:
  gem "therubyracer",         "~> 0.9.10"

  gem "uglifier",             ">= 1.0.3"
end

group :test do
  gem "cucumber-rails",       "~> 1.3.0"
  gem "database_cleaner",     "~> 0.7.2"
  gem "email_spec",           "~> 1.2.1"
  gem "factory_girl_rails",   "~> 3.0.0"
  gem "launchy",              "~> 2.1.0"
  gem "rspec-rails",          "~> 2.9.0"
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
