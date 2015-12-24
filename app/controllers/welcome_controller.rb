class WelcomeController < ApplicationController

  def index
    if current_user.nil?
      redirect_to root_path
    end
    @service = service_connection.client
    @timeline = service_connection.timeline
    @name = service_connection.client.user.name
  end

  def show
    if current_user
      redirect_to dashboard_path
    end
  end
end
