require 'rubygems'
require 'spork'

Spork.prefork do
  # SimpleCov for code coverage
  require 'simplecov'
  SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'

  # avoid caching classes: http://bit.ly/P98yjl
  require 'rails/application'
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    # config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
  end

end

Spork.each_run do
  # avoid caching classes: http://bit.ly/P98yjl
  #   we are not using Fabrication in RSpec, so not needed right now
  # Fabrication.clear_definitions
end #if Spork.using_spork?
