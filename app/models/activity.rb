class Activity < ApplicationRecord
  TYPE = ["Sport", "Musique", "Cuisine", "Art", "Lecture", "Voyage", "Jardinage", "Jeux de société", "Randonnée", "Camping", "Théâtre", "Danse", "Photographie", "Bricolage", "Écriture", "Méditation", "Natation", "Cinéma", "Équitation", "Astronomie"]
  belongs_to :user
  has_many :registrations, dependent: :destroy

  # Cloudinary
  has_many_attached :photos

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true, uniqueness: { scope: :user }
  validates :address, presence: true
  validates :city, presence: true
  validates :activity_type, inclusion: { in: TYPE }
end
