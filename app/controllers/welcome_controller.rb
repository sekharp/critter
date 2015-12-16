class WelcomeController < ApplicationController
  def index
    @service = TwitterService.new(current_user) unless current_user.nil?
  end
end
