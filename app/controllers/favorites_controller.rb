class FavoritesController < ApplicationController
  def index
    @activities = []
    fav_activities = current_user.favorites_by_type('Activity')
    fav_activities.each do |fav|
      @activities << Activity.find(fav.favoritable_id)
    end
    @users = []
    fav_users = current_user.favorites_by_type('User')
    fav_users.each do |fav|
      @users << User.find(fav.favoritable_id)
    end
  end
end
