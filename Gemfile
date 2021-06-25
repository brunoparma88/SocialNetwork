# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

group :test do
  gem 'capybara', '>= 3.26'
  gem 'faker', '~> 2.17'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rspec-support', '~> 3.10', '>= 3.10.2'
  gem 'shoulda', '~> 4.0'
  gem 'shoulda-matchers', '~> 4.1', '>= 4.1.2'
  gem 'simplecov', '~> 0.13.0', require: false
  gem 'webmock', '~> 3.7', '>= 3.7.6'
end

group :development, :test do
  gem 'byebug'
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  gem 'devise', '~> 4.8'
  gem 'devise_token_auth', '~> 1.1', '>= 1.1.5'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
end

group :development do
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  gem 'brakeman', '~> 5.0', '>= 5.0.1'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rails_best_practices', '~> 1.20'
  gem 'reek', '~> 5.5'
  gem 'rubocop-rails', '~> 2.0', require: false
  gem 'rubocop-rootstrap', '~> 1.2'
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'web-console', '>= 4.1.0'
end

gem 'nokogiri', '~> 1.11', '>= 1.11.6'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.crailrom/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
gem 'koala', '~> 2.4'
gem 'omniauth-facebook', '~> 4.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
