require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def auth_info
    OmniAuth::AuthHash.new({
        'uid' => '12345',
        'extra' => { 'raw_info' => { 'name' => 'Sekhar', 'screen_name' => 'sekharp' }},
        'credentials' => {'token' => '67', 'secret' => '89' }
      })
  end

  test "user can be found" do
    User.from_omniauth(auth_info)
    user = User.last

    assert_equal '12345', user.uid
    assert_equal 'Sekhar', user.name
    assert_equal 'sekharp', user.screen_name
    assert_equal '67', user.oauth_token
    assert_equal '89', user.oauth_token_secret
  end
end
