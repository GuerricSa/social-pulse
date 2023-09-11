class Activity < ApplicationRecord
  TYPE = ["Sport", "Musique", "Cuisine", "Art", "Lecture", "Voyage", "Jardinage", "Jeux de societe", "Randonnee", "Camping", "Theatre", "Danse", "Photographie", "Bricolage", "Ecriture", "Meditation", "Natation", "Cinema", "Equitation", "Astronomie"]
  belongs_to :user
  has_many :registrations, dependent: :destroy

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
  against: %i[ title content address city activity_type ],
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

  # Méthode qui permet de récupérer les activités futures
  def self.all_future
    future = []
    Activity.order(:date).each do |activity|
      future << activity if activity.date >= DateTime.now
    end
  end

  # Méthode qui permet de récupérer les activités passées
  def self.all_past
    past = []
    Activity.order(date: :desc).each do |activity|
      past << activity if activity.date < DateTime.now
    end
  end

  after_commit :add_default_photo, on: %i[create update]

  private

  def add_default_photo
    unless photo.attached?
      file = URI.open("https://source.unsplash.com/random/?#{self.activity_type}")
      self.photo.attach(io: file, filename: "photo-default.png", content_type: "image/png")
      self.save
    end
  end
end
