source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "rails", "~> 7.0.1"

gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sassc-rails"
gem "slim-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'capybara'
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'webdrivers'
end

group :development do
  gem "web-console"
  gem "spring"
end

