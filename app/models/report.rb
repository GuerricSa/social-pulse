class Report < ApplicationRecord
  STATUS = ["pending", "completed"]

  belongs_to :reporter, class_name: "User"
  belongs_to :defendant, class_name: "User"

  validates :content, presence: true
  validates :status, inclusion: { in: STATUS }
end
