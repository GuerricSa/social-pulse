class FavoritesController < ApplicationController
  def index
    fav_activities = current_user.favorites_by_type('Activity')
    @activities = Activity.all_future.select do |activity|
      fav_activities.any? { |fav| fav.favoritable_id == activity.id }
    end
    @users = []
    fav_users = current_user.favorites_by_type('User')
    fav_users.each do |fav|
      @users << User.find(fav.favoritable_id)
    end
  end
end
