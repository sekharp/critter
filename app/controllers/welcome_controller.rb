class WelcomeController < ApplicationController
  def index
    @service = service_connection.client unless current_user.nil?
    @timeline = service_connection.timeline
    @name = service_connection.client.user.name
  end

  def show
  end
end
