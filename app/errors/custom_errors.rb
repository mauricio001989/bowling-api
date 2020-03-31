module CustomErrors
  class OAuthError < StandardError; end

  class BowlingError < StandardError
    def message
      I18n.t('activerecord.errors.models.bowling_game')
    end
  end

  class PointsError < StandardError
    def message
      I18n.t('activerecord.errors.models.bowling_game.points_error')
    end
  end
end
