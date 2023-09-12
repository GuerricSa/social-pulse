class NotificationsController < ApplicationController
  before_action :set_notification, only: :mark_as_read

  def index
    @notifications = current_user.notifications
  end

  def mark_as_read
    authorize @notification
    @notification.mark_as_read!
    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.text { render partial: "notifications/notification", locals: {notification: @notification}, formats: [:html] }
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
