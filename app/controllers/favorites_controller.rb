class FavoritesController < ApplicationController
  def create
    service_connection.favorite(params[:tweet_id])
    redirect_to dashboard_path
  end
end
