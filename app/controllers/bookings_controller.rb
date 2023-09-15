class BookingsController < ApplicationController
  before_action :set_activity, only: %i[create]

  def create
    @registration = Booking.new
    authorize @registration
    @registration.user = current_user
    @registration.activity = @activity
    unless @registration.save
      render "activities/show", status: :unprocessable_entity
    end
  end

  def destroy
    @registration = Booking.find(params[:id])
    authorize @registration
    @registration.destroy
    redirect_to activity_path(@registration.activity), status: :see_other
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
