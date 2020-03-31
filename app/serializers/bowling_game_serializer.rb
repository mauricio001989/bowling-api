class BowlingGameSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :bowling_lane

  attributes :id, :total_points, :points
end
