class BowlingLane < ApplicationRecord
  # == Relationships ========================================================
  has_many :bowling_games, dependent: :destroy

  # == Validations ==========================================================
  validates :length, presence: true
end
