class TwitterService
  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def post(message)
    @client.update(message)
  end

  def timeline
    @client.home_timeline
  end

  # TwitterService.new(current_user).update("hello world")
end
