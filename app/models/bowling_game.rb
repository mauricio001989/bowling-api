class BowlingGame < ApplicationRecord
  # == Relationships ========================================================
  belongs_to :user
  belongs_to :bowling_lane

  private

  # == Instance Methods =====================================================
  def validates_points
    raise ActiveRecord::Rollback unless validate_length?
  end
end
