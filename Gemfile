source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

##### BACKEND #####

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.0'
# Minimal authorization through OO design and pure Ruby classes
gem 'pundit', '~> 1.1.0'
# Form objects decoupled from models
gem 'reform', '~> 2.2.4'
gem 'reform-rails', '~> 0.1.7'
gem 'file_validators'
# Forms made easy for Rails!
gem 'simple_form', '~> 3.5.0'
# OmniAuth is a flexible authentication system utilizing Rack middleware
gem 'omniauth'
gem 'omniauth-linkedin'

# Easy file attachment management for ActiveRecord
gem 'paperclip'

# MailCatcher runs a super simple SMTP server
gem 'mailcatcher'

# RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data
gem 'rails_admin'

# Decorators/View-Models for Rails Applications
gem 'draper'

# Ruby gem for colorizing text using ANSI escape sequences.
gem 'colorize'

# This ensures that devise will update a last_seen timestamp on the model whenever you check if a user is authenticated.
gem 'devise_lastseenable'

# ActiveModel::Serializer implementation and Rails hooks
gem 'active_model_serializers'

####################

##### FRONTEND #####

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Bootstrap is a toolkit from Twitter designed to kickstart development of web apps and sites.
gem 'twitter-bootstrap-rails', '~> 4.0.0'
# High Performance Haml Implementation
gem 'hamlit', '~> 2.8.4'
# Converts HTML to Haml
gem 'html2haml', '~> 2.2.0'
# Hamlit generators
gem 'hamlit-rails', '~> 0.2.0'
# Font-Awesome web fonts and stylesheets as a Rails engine for use with the asset pipeline
gem 'font-awesome-rails', '~> 4.7.0.2'
# Devise views with Bootstrap 3
gem 'devise-bootstrap-views'
# Select2 is a jQuery based replacement for select boxes.
gem 'select2-rails', '~> 3.5.2'
# Use handlebars.js templates with the Rails asset pipeline.
gem 'handlebars_assets'

#####################

##### GROUPS #####

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Pretty print your Ruby objects with style
  gem 'awesome_print'
  # Help to kill N+1 queries and unused eager loading
  gem 'bullet'
end

group :test do
  gem 'json_spec'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'simplecov'
  gem 'faker'
  gem 'poltergeist'
end

##################

##### WINDOWS #####

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

##################
