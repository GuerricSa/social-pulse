class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, length: { minimum: 1 }

  def sender?(a_user)
    user.id == a_user.id
  end
end
