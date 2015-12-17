class WelcomeController < ApplicationController
  def index
    @service = service_connection.client unless current_user.nil?
    @timeline = service_connection.timeline unless current_user.nil?
    @name = service_connection.client.user.name unless current_user.nil?
  end

  def show
  end
end
