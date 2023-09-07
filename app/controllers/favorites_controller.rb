class FavoritesController < ApplicationController
  def index
    @activities = current_user.favorites_by_type('Activity')
    @users = current_user.favorites_by_type('User')
  end
end
