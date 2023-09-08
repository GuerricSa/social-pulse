class Activity < ApplicationRecord
  TYPE = ["Sport", "Musique", "Cuisine", "Art", "Lecture", "Voyage", "Jardinage", "Jeux de société", "Randonnée", "Camping", "Théâtre", "Danse", "Photographie", "Bricolage", "Écriture", "Méditation", "Natation", "Cinéma", "Équitation", "Astronomie"]
  belongs_to :user
  has_many :registrations, dependent: :destroy
  # has_many :favorites

  # Cloudinary
  has_one_attached :photo

  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true, uniqueness: { scope: :user }
  validates :address, presence: true
  validates :city, presence: true
  validates :activity_type, inclusion: { in: TYPE }

  # PG Search
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title, :content, :city, :activity_type, :date ],
  using: {
    tsearch: { prefix: true }
  }

  # Geocode
  def full_address
    [address, city].compact.join(', ')
  end

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

  # Favorites
  acts_as_favoritable
end
