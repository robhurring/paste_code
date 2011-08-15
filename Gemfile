source :rubygems

gem 'rails', '3.1.0.rc5'
gem 'mysql2'
gem 'jquery-rails'

group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3'
end

group :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'passenger'
  gem 'heroku'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end