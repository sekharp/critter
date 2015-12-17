class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :service, :user

  def create_user
    @user = User.new(oauth_token: ENV["ACCESS_TOKEN"],
                     oauth_token_secret: ENV["ACCESS_SECRET"])
  end

  def setup
    create_user
    @service = TwitterService.new(user)
  end

  test '#timeline' do
    VCR.use_cassette('twitter_service#timeline') do
      timeline = service.timeline

      assert_equal 20, timeline.count
      assert_equal Twitter::Tweet, timeline.first.class
    end
  end

  test '#follower_count' do
    VCR.use_cassette('twitter_service#follower_count') do
      follower_count = service.follower_count

      assert_equal 11, follower_count
    end
  end

  test '#tweet_count' do
    VCR.use_cassette('twitter_service#tweet_count') do
      tweet_count = service.tweet_count

      assert_equal 8, tweet_count
    end
  end

  test '#friends_count' do
    VCR.use_cassette('twitter_service#friends_count') do
      friends_count = service.friends_count

      assert_equal 15, friends_count
    end
  end

end
