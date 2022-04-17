source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.2"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "redis", "~> 4.0"
gem "kredis"
gem "foreman", "~> 0.87.2"
gem "dotenv-rails", "~> 2.7"
gem "bootsnap", require: false

group :development, :test do
  gem 'annotate'                            # modelにテーブルのカラムをコメントで出力
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'simplecov'                           # テストのカバレッジ取得
  gem 'onkcop', require: false              # rubocop best practice
  gem 'rubocop', require: false             # code lint
  gem 'rubocop-rails'
  gem 'rubocop-performance'
  gem 'solargraph'                          # lsp
  gem 'prettier'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem "web-console"
end

group :test do
  gem 'database_cleaner'
end

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
