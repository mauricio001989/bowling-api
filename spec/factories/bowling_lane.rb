FactoryBot.define do
  factory :bowling_lane do
    length { Faker::Number.within(range: 1..10) }
  end
end
