class BasicInteractor
  private

  TRIES = %w[strike spare total in_process].freeze

  def limint_roun
    return false unless @points.count == 10

    suma_accumulate_2(2, -1) if @points.last(2).first[number_raund -1]['accumulate'] >= 1

    suma_accumulate_2(1, 0) if @points.last[number_raund 0]['accumulate'] >= 1

    true
  end

  def number_raund(number)
    "raund-#{@points.count + number}"
  end

  def accumulate(suma)
    suma == 10 ? 1 : 0
  end

  def sum_and_tries
    base = @points.last[number_raund 0]
    sum = base['frames']['golpe_1'] + point

    raise CustomErrors::PointsError if sum > 10

    base['accumulate'] = accumulate(sum)
    sum == 10 ? TRIES[1] : TRIES[2]
  end

  def suma_accumulate
    if @points.count > 1
      suma_accumulate_2(2, -1) if @points.last(2).first[number_raund -1]['accumulate'] >= 1
    end
    return unless @points.count > 2

    suma_accumulate_2(3, -2) if @points.last(3).first[number_raund -2]['accumulate'] >= 1
  end

  def suma_accumulate_2(points_location, raund)
    bowling_game.points.last(points_location).first[number_raund raund]['accumulate'] += -1
    bowling_game.total_points += point
    bowling_game.save
  end
end
