class FavoritesController < ApplicationController
  def create
    service_connection.favorite(params[:tweet_id])
    redirect_to root_path
  end
end
