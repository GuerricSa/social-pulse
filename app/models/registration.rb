class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :activity, uniqueness: { scope: :user }

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
end
