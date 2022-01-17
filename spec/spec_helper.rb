require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'simplecov'
require 'simplecov-console'
ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './setup_test_database'


# Tell Capybara to talk to Chitter
Capybara.app = Chitter


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

# Require all the testing gems
