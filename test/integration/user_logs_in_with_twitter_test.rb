require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Critter::Application
    stub_omniauth
  end

  test "user can login" do
    VCR.use_cassette('user_logs_in') do
      login_user

      assert_equal "/dashboard", current_path
      assert page.has_content?("Sekhar Paladugu's Critter Feed")
      assert page.has_link?("Logout")
    end
  end
end
