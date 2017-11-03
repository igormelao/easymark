class DailyMark < ApplicationRecord
  belongs_to :mark

  validates :date, :value, presence: true
end
