require 'rails_helper'

RSpec.describe Api::V1::BowlingGamesController, type: :controller do
  describe 'PUT #update' do
    subject(:http_request) { put :update, params: params }
    let(:bowling_game) { create(:bowling_game, total_points: 0) }
    let(:params) do
      {
        id: bowling_game.id,
        points: 10
      }
    end

    context "when is ten point in first tries" do
      before do
        http_request
      end

      it 'when responds ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'when this tries is strinke' do
        expect(JSON(response.body)['points'][0]['raund-1']['tries']).to eq('strike')
      end
    end
  end
end
