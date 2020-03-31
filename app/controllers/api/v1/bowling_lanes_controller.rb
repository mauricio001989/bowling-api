module Api
  module V1
    class BowlingLanesController < ApiController
      # GET /api/v1/bowling_lanes
      def index
        render json: BowlingLane.all
      end

      # GET /api/v1/bowling_lanes/:id
      def show
        render json: bowling_lane
      end

      # POST /api/v1/bowling_lanes
      def create
        bowling_lane = BowlingLane.new(bowling_lane_params)

        return render json: bowling_lane, status: :created if bowling_lane.save

        render json: bowling_lane.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /api/v1/bowling_lanes/1
      def update
        return render json: bowling_lane if bowling_lane.update(bowling_lane_params)

        render json: bowling_lane.errors, status: :unprocessable_entity
      end

      # DELETE /api/v1/bowling_lanes/1
      delegate :destroy, to: :bowling_lane

      private

      def bowling_lane
        @bowling_lane ||= BowlingLane.find(params[:id])
      end

      def bowling_lane_params
        params.require(:bowling_lane).permit(:length)
      end
    end
  end
end
