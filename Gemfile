source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data"
gem "tzinfo"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# User model for authentication, registration, session, views, access control
gem 'devise'

# FactoryBot for mocks and stubs with testing
gem 'factory_bot_rails'

# Creates random data for mocks and stubs
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'main'

# For testing flash message responses in the controller
gem 'shoulda'

# Front-end framework for HTML, CSS, JavaScript
gem 'bootstrap', '~> 5.2.2'

# JavaScript can optionally use jQuery
gem 'jquery-rails'

# Was typically included in examples, increases performance
gem 'turbolinks'

group :production do
  gem 'pg' # for Heroku deployment
  gem 'rails_12factor'
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ] 
  gem "sqlite3", "~> 1.4"
  gem "rspec-rails", "~> 4.0.1"
  gem "capybara"
  gem "simplecov", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'database_cleaner-active_record'
end
