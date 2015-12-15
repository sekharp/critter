class WelcomeController < ApplicationController
  def index
    @service = TwitterService.new(current_user)
  end
end
