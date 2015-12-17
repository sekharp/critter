ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'simplecov'
require 'webmock'
require 'vcr'
require 'minitest/pride'
require 'capybara/rails'

SimpleCov.start("rails")

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into(:webmock)
  end

  # Add more helper methods to be used by all tests here...
end
