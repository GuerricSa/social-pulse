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
end
