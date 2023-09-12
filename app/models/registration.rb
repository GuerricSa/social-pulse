class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :activity, uniqueness: { scope: :user }

  # Standard association for deleting notifications when you're the recipient
  has_many :notifications, as: :recipient, dependent: :destroy

  # Helper for associating and destroying Notification records where(params: {post: self})
  has_noticed_notifications
  
  after_create :notify_creator

  # Méthode qui permet de récupérer les participations futures
  def self.all_future
    future = []
    Registration.joins(:activity).order(:date).each do |registration|
      future << registration if registration.activity.date >= DateTime.now
    end
  end

  # Méthode qui permet de récupérer les participations passées
  def self.all_past
    past = []
    Registration.joins(:activity).order(:date).each do |registration|
      past << registration if registration.activity.date < DateTime.now
    end
  end

  private

  def notify_creator
    NewRegistration.with(registration: self).deliver(self.activity.user)
  end
end
