source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.3.13'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use Devise for user auth
gem 'devise'
# Bootstrap 4
gem 'bootstrap', '~> 4.0.0.alpha3'
# Tether (bootstrap dep)
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
# Angular Rails CSRF Header
gem 'angular_rails_csrf'
gem 'rack-cors', require: 'rack/cors'
gem 'bower-rails'

gem 'foreman'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :production, :staging do
  gem "rails_12factor"
  gem "rails_stdout_logging"
  gem "rails_serve_static_assets"
end
