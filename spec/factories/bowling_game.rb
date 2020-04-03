FactoryBot.define do
  factory :bowling_game do
    total_points { Faker::Number.within(range: 1..10) }
    bowling_lane
    user
    points { '0' }
  end
end
