class BowlingGame < ApplicationRecord
  # == Relationships ========================================================
  belongs_to :user
  belongs_to :bowling_lane
end
