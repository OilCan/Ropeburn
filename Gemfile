source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'

# Postgres, woo woo
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma', '~> 2.11.1'

# High-level Application Features
gem 'dotenv-rails', '~> 2.0', require: 'dotenv/rails-now'
gem 'devise', '~> 3.2'
gem 'omniauth-google-oauth2', '~> 0.2.6'
gem 'omniauth-github', '~> 1.1.2'
gem 'cancancan', '~> 1.10.1'
gem 'sidekiq', '~> 3.3.3'
gem 'sinatra', '>= 1.3.0', require: nil # For Sidekiq's UI

gem 'active_model_serializers', '~> 0.9'
gem 'slim', '~> 3.0'
gem 'redcarpet', '~> 3.2.3'
gem "octokit", "~> 3.8.0"
gem 'mandrill-api', '~> 1.0.53'

gem 'bootstrap-sass', '~> 3.3.3'
gem 'font-awesome-sass', '~> 4.3.0'

gem 'awesome_print'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'database_cleaner', '~> 1.4'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'guard-rspec', '~> 4.5', require: false
  gem "faker"

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

end

group :development do
  gem 'quiet_assets'
  # Use Capistrano for deployment
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv'
  gem 'capistrano-foreman'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-faster-assets', '~> 1.0'
end


