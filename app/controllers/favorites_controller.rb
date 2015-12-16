class FavoritesController < ApplicationController
  def create
    TwitterService.new(current_user).client.favorite(params[:tweet_id])
    redirect_to root_path
  end
end
