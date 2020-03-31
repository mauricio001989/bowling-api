class ApiController < ApplicationController
  include CustomErrors
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :unprocessable_entity
  rescue_from CustomErrors::PointsError, with: :points_error
  rescue_from CustomErrors::BowlingError, with: :bowling_error

  private

  def points_error
    error = CustomErrors::PointsError.new.message
    render_error(error, :bad_request)
  end

  def bowling_error
    error = CustomErrors::BowlingError.new.message
    render_error(error, :unprocessable_entity)
  end

  def record_not_found
    error = I18n.t('application.alerts.messages.record_not_found')
    render_error(error, :not_found)
  end

  def unprocessable_entity
    error = I18n.t('activerecord.errors.models.[model_name]')
    render_error(error, :unprocessable_entity)
  end

  def render_error(error, status)
    render json: { errors: [error] }, status: status
  end
end
