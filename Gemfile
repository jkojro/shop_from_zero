# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'dry-monads', '~> 1.3', '>= 1.3.5'
gem 'dry-validation', '~> 1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pg_search', '~> 2.3', '>= 2.3.2'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.0'
end

group :development do
  gem 'faker'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails', '~> 2.5', '>= 2.5.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 3.32', '>= 3.32.1'
  gem 'capybara-screenshot', '~> 1.0', '>= 1.0.24'
  gem 'database_cleaner', '~> 1.8', '>= 1.8.4'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
