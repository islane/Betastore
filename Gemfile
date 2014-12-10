source 'https://rubygems.org'
source 'https://rails-assets.org/'
ruby '2.1.2'

gem 'rails-assets-bootstrap'

gem 'puma'

gem 'rails', '4.1.6'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Background processing - http://sidekiq.org/
gem 'sidekiq'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Stripe for payments/checkout
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Rails security scanner
gem 'brakeman', require: false

gem 'newrelic_rpm'
gem 'bugsnag'
gem 'rails_12factor', group: :production
gem 'faker'

group :development do
  gem 'hirb'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. https://github.com/rails/spring
end

group :development, :test do
  gem 'pry'
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara'
  gem 'launchy'
end
