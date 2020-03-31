module Bowlings
  class CreateBowlingGame < BasicInteractor
    include Interactor

    def call
      @points = bowling_game.points
      return context.output = bowling_game if limint_roun || point > 10

      validation_level? ? sum_point : @points.push(create_raund)

      raise PointsError unless bowling_game.save

      points_sum
      context.output = bowling_game
    end

    private

    delegate :bowling_game, :point, to: :context

    def validation_level?
      return false if @points.blank?

      @points.last[number_raund(0)]['tries'] == TRIES[3]
    end

    def sum_point
      @points.last[number_raund(0)]['frames']['golpe_2'] = point
      @points.last[number_raund(0)]['tries'] = sum_and_tries
    end

    def create_raund
      (Hash["#{number_raund(1)}": {
        tries: point == 10 ? TRIES[0] : TRIES[3],
        frames: { golpe_1: point, golpe_2: 0 },
        accumulate: point == 10 ? 2 : 0
      }])
    end

    def points_sum
      suma_accumulate
      bowling_game.total_points += point
      bowling_game.save
    end
  end
end
