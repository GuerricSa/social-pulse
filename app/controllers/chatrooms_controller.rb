class ChatroomsController < ApplicationController
  def index
    @chatrooms = []
    activity_id = []
    current_user.registrations.each do |registration|
      activity_id << registration.activity_id
    end
    Chatroom.all.each do |chatroom|
      if chatroom.activity.user == current_user
        @chatrooms << chatroom
      elsif activity_id.include?(chatroom.activity_id)
        @chatrooms << chatroom
      end
    end
  end
    # Chatroom.joins(:registration).where("registration.user = current_user").each do |chatroom|
    #   @chatrooms << chatroom
    # end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    Message.where(chatroom: @chatroom).mark_as_read! :all, for: current_user
  end
end
