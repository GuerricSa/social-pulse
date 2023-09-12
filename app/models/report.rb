class Report < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :defendant, class_name: "User"

  validates :content , presence: true
end
