class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, length: { minimum: 1 }

  def sender?(a_user)
    user.id == a_user.id
  end

  # Messages
  acts_as_readable on: :created_at

  def self.my_messages(user)
    count = 0
    Message.unread_by(user).each do |message|
      if message.chatroom.activity.user == user
        count += 1
      elsif message.chatroom.activity.bookings.each do |registration|
        if registration.user == user
          count += 1
        end
      end
      end
    end
    return count
  end

  def self.my_chatrooms_messages(user, chatroom)
    count = 0
    Message.unread_by(user).each do |message|
      if message.chatroom.activity.user == user && message.chatroom == chatroom
        count += 1
      elsif message.chatroom.activity.bookings.each do |registration|
        if registration.user == user && message.chatroom == chatroom
          count += 1
        end
      end
      end
    end
    return count
  end
end
