require 'simplecov'
SimpleCov.start 'rails'

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/fixtures/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.color_enabled  = true
  config.full_backtrace = true
  config.mock_with :rspec

  config.infer_base_class_for_anonymous_controllers      = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.include FactoryGirl::Syntax::Methods
  config.include Mongoid::Matchers
  
  config.before(:suite) do
    DatabaseCleaner.orm      = :mongoid
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.after(:suite) do
    Mongoid.master.connection.drop_database("#{Mongoid.master.name}")
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Rails.logger.level = 4
