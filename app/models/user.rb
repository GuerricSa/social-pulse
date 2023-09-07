require "open-uri"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities, dependent: :destroy
  has_many :registrations, dependent: :destroy

  validates :first_name, :age, :email, :password, presence: true
  validates :age, numericality: { only_integer: true, in: 15..100 }
  validates :presentation, length: { maximum: 150 }
  validates :email, uniqueness: true

  has_one_attached :avatar

  after_commit :add_default_avatar, on: %i[create update]

  private

  def add_default_avatar
    unless avatar.attached?
      file = URI.open("https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg")
      self.avatar.attach(io: file, filename: "avatar-default.png", content_type: "image/png")
      self.save
    end
  end
end
