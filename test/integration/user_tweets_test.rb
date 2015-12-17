require 'test_helper'

class UserTweetsTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Critter::Application
    stub_omniauth
    login_user
  end

  test "user can tweet" do
    VCR.use_cassette('user_tweets') do
      visit dashboard_path

      fill_in 'tweet[text]', with: 'Baa baa baa'
      click_button 'Tweet'

      assert page.has_content? "baa baa sheep"
    end
  end
end
