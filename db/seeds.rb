puts 'Create user'
user = User.create(name: 'mao', email: 'mao@ggg.com', document: '1111')

puts 'Create Bowling lane'
lane = BowlingLane.create(length: '19.20')

puts 'Create Bowling games'
BowlingGame.create(points: [{ point: 12 }, { point: 13 }], user: user, bowling_lane: lane)
