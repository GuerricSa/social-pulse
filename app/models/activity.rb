class Activity < ApplicationRecord
  TYPE = ["Sport", "Musique", "Cuisine", "Art", "Lecture", "Voyage", "Jardinage", "Jeux de societe", "Randonnee", "Camping", "Theatre", "Danse", "Photographie", "Bricolage", "Ecriture", "Meditation", "Natation", "Cinema", "Equitation", "Astronomie"]
  belongs_to :user
  has_many :registrations, dependent: :destroy
  has_many :chatrooms, dependent: :destroy

  # Cloudinary
  has_one_attached :photo

  validates :title, presence: true
  validates :title, length: { maximum: 50 }
  validates :content, presence: true
  validates :content, length: { maximum: 700 }
  validates :date, presence: true, uniqueness: { scope: :user }
  validates :address, presence: true
  validates :city, presence: true
  validates :activity_type, inclusion: { in: TYPE }

  # Helper for associating and destroying Notification records where(params: {post: self})
  has_noticed_notifications

  after_create :notify_favoritor

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
    Activity.all.each do |activity|
      future << activity if activity.date >= DateTime.now
    end
    return future.sort_by(&:date)
  end

  # Méthode qui permet de récupérer les activités passées
  def self.all_past
    past = []
    Activity.all.each do |activity|
      past << activity if activity.date < DateTime.now
    end
    return past.sort_by(&:date).reverse
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

  def notify_favoritor
    NewActivity.with(activity: self).deliver(self.user.favoritors)
  end
end
