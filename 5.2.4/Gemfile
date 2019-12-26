source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.4'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
# gem 'unicorn'
gem 'mini_racer'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'dotenv-rails'
gem 'enum_help'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'annotate'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'bullet'
  gem 'binding_of_caller'
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'capybara'
  gem 'simplecov'
  gem 'webdrivers'
  gem 'factory_bot'
  gem 'onkcop', require: false
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rack-mini-profiler', require: false
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'letter_opener'
  gem 'letter_opener_web'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
