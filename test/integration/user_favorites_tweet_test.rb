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

      first('.blog-post').click_link('Favorite')

      assert first('.blog-post').has_content?("Favorited")
    end
  end
end
