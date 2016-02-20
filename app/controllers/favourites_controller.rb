class FavouritesController < ApplicationController
  before_action :require_user

  def index
    @favourites = {
      favourite_users: current_user.favourite_users,
      favourite_tweets: current_user.favourite_tweets
    }
  end
end
