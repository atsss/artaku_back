source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'mysql2'
gem 'puma'
gem 'rails', '6.1.1'
gem 'webpacker'

# API
gem 'graphql'
gem 'rack-cors'

# Image
gem 'google-cloud-storage', '~> 1.8', require: false
gem 'image_processing'

# Admin
gem 'rails_admin'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  gem 'annotate'
  gem 'dotenv-rails'
  gem 'graphiql-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
end

group :development do
  gem 'web-console'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
