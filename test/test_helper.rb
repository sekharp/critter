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
  include Capybara::DSL

  VCR.configure do |config|
    config.cassette_library_dir = "test/cassettes"
    config.hook_into(:webmock)
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Sekhar Paladugu",
          screen_name: "SekharPaladugu",
        }
      },
      credentials: {
        token: ENV['ACCESS_TOKEN'],
        secret: ENV['ACCESS_SECRET']
      }
    })
  end

  def login_user
    visit root_path
    click_on "Login"
  end

  # Add more helper methods to be used by all tests here...
end
