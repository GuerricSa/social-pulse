class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update toggle_favorite]

  def index
    @activities = policy_scope(Activity)

    # Pour Geocode / MapBox
    @markers = @activities.geocoded.map do |activity|
      {
        lat: activity.latitude,
        lng: activity.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { activity: activity }),
        marker_html: render_to_string(partial: "marker")
      }
    end

    if params[:query].present?
      @activities = Activity.search_by_title_and_content(params[:query])
    else
      @activities = Activity.all
    end
  end

  def show
    authorize @activity
    @my_registration = Registration.find_by(user: current_user, activity: @activity)
  end

  def new
    @activity = Activity.new
    authorize @activity
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    authorize @activity
    if @activity.save!
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @activity = Activity.update(activity_params)
  end

  def my_activities
    @activities = Activities.where(user: current_user)
  end

  def toggle_favorite
    authorize @activity
    if current_user.favorited?(@activity)
      current_user.unfavorite(@activity)
    else
      current_user.favorite(@activity)
    end
  end

  # def duplicate
  #   @user = current_user
  #   @activity = Activity.new(activity_params)
  #   @activity.user = @user
  #   if @activity.save
  #     redirect_to activity_path(@activity)
  #   else
  #     render :new
  #   end
  # end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :content, :date, :duration, :address, :city, :participants_max, :activity_type, :photo)
  end
end
