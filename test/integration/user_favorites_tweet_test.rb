require 'test_helper'

class UserFavoritesTweetTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Critter::Application
    stub_omniauth
    login_user
  end

  test "user can favorite a tweet" do
    VCR.use_cassette('user_can_favorite_tweets') do
      visit dashboard_path

      within('.tweet-0') do
        click_link('Favorite')
      end

      within('.tweet-0') do
        assert page.has_content?("Favorited")
      end
    end
  end
end
