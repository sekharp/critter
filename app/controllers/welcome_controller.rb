class WelcomeController < ApplicationController
  def index
    @user = current_user.twitter.user
    @twitter = current_user.twitter
  end
end
