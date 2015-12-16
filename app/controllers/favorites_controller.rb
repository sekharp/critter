class FavoritesController < ApplicationController
  def create
    current_client.favorite(params[:tweet_id])
    redirect_to root_path
  end

  # def destroy
  #   current_client.favorite(params[:tweet_id])
  #   redirect_to root_path
  # end
end
