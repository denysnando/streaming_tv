source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.7.1'

gem 'rails',       '~> 6.0.2', '>= 6.0.2.2'
gem 'pg',          '~> 0.21.0'
gem 'bootsnap',    '>= 1.4.2', require: false
gem 'factory_bot', '5.0.2', require: false

# Server
gem 'puma',     '~> 4.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec', '3.8.0'
  gem 'rspec-rails', '3.8.2'
  gem 'factory_bot_rails', '5.0.1'
  gem 'faker', '1.9.3'
  gem 'shoulda-matchers', '4.0.1'
  gem 'rails-controller-testing', '1.0.4'
  gem 'database_cleaner', '1.7.0'
  gem 'fuubar', '2.3.2'
  gem 'simplecov', '0.16.1'
  gem 'rspec-simplecov', '0.2.2'
end

group :development do
  gem 'listen',                '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
