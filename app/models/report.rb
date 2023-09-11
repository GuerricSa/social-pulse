class Report < ApplicationRecord
  belongs_to :reporter
  belongs_to :defendant
end
