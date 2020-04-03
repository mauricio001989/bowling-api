module Api
  module V1
    class BowlingGamesController < ApiController
      # # GET /api/v1/bowling_games
      def index
        render json: BowlingGame.all
      end

      # GET /api/v1/bowling_games/1
      def show
        render json: bowling_game
      end

      # POST /api/v1/bowling_games
      def create
        render json: validate? ? update_bowling_game : create_bowling_game, status: :created
      end

      # PATCH/PUT /api/v1/bowling_games/points
      def update
        result = Bowlings::CreateBowlingGame.call(
          bowling_game: bowling_game, point: params.require(:points).to_i
        ).output

        render json: result
      end

      private

      def validate?
        BowlingGame.exists?(user_id: bowling_game_params[:user_id],
                            bowling_lane_id: bowling_game_params[:bowling_lane_id])
      end

      def create_bowling_game
        bowling_game = BowlingGame.new(bowling_game_params.merge(points: []))
        return bowling_game if bowling_game.save

        raise BowlingError
      end

      def update_bowling_game
        game = BowlingGame.find_by(bowling_game_params)
        game.update(points: [], total_points: 0)
      end

      def bowling_game
        @bowling_game ||= BowlingGame.find(params[:id])
      end

      def bowling_game_params
        params.require(:bowling_game).permit(:user_id, :bowling_lane_id)
      end
    end
  end
end
