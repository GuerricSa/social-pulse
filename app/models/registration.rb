class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :activity, uniqueness: { scope: :user }

  # Méthode qui permet de récupérer les participations futures
  def self.all_future
    future = []
    Registration.all.each do |registration|
      future << registration if registration.activity.date >= DateTime.now
    end
    return future.sort_by { |registration| registration.activity.date }
  end

  # Méthode qui permet de récupérer les participations passées
  def self.all_past
    past = []
    Registration.all.each do |registration|
      past << registration if registration.activity.date < DateTime.now
    end
    return past.sort_by { |registration| registration.activity.date }.reverse
  end
end
