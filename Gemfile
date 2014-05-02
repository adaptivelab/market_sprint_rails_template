source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "4.1.0"

gem "activeadmin", git: "https://github.com/adaptivelab/active_admin"

# Use SCSS for stylesheets
gem "sass-rails", "~> 4.0.3"

# Use Haml for the Hammely bits
gem "haml-rails", "0.5.3"

# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem "jquery-rails", ">= 0"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem "turbolinks", ">= 0"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.0"

# bundle exec rake doc:rails generates the API under doc/api.
gem "sdoc", "~> 0.4.0", require: false

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem "bcrypt-ruby", "~> 3.0.0"

# Use Capistrano for deployment
# gem "capistrano", group: :development

# Use debugger
gem "debugger", "1.6.3", group: [:development, :test]

# Add Devise
gem "devise", "3.2.2"

group :development do
  gem "better_errors", "1.1.0"
end

group :test do
  gem "binding_of_caller", "0.7.2"
  gem "capybara", "2.1.0"
  gem "cucumber-rails", "1.4.0", require: false
  gem "database_cleaner", "1.2.0"
  gem "factory_girl_rails", "4.3.0"
  gem "launchy", "2.4.2"
  gem "poltergeist", "1.5.0"
  gem "rspec-rails", "2.14.0"
  gem "selenium-webdriver", ">= 2.37.0"
  gem "timecop", "0.6.3"
  gem "webmock", "1.15.2"
  gem "vcr", "2.7.0"
end

group :test, :development do
  gem "sqlite3", ">= 0"
  gem "dotenv-rails", "0.9.0"
end

group :production, :staging do
  gem "pg", "0.17.0"
  gem "rails_12factor", "0.0.2"

  # Use unicorn as the app server
  gem "unicorn", "4.6.3"
end
