source 'https://rubygems.org'

gem 'rails', '3.2.6'
ruby '1.9.3'


gem 'activeadmin'
gem 'airbrake'
gem 'bootstrap-sass'
gem 'coffee-filter'
gem 'datejs-rails'
gem 'haml-rails'
gem 'i18n_routing'
gem 'jbuilder'
gem 'jquery-rails'
gem 'state_machine'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'sprite-factory'
    gem 'chunky_png'
end

group :development, :test do
  gem 'annotate', '~> 2.4.1.beta1'    # TODO: remove after 2.4.1 release http://bit.ly/w19m7c
  gem 'capistrano'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'faker'
  gem 'heroku'
  gem 'rails_best_practices'
  gem 'roodi'
  gem 'rspec-rails'
  gem 'sqlite3'

  # To use debugger
  # gem 'debugger'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'fivemat'
  gem 'simplecov', :require => false
  gem 'spork-rails'
end

group :production do
  gem 'pg'
end
