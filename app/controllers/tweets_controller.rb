class TweetsController < ApplicationController
  def create
    service_connection.post(params[:tweet][:text])
    redirect_to root_path
  end
end
