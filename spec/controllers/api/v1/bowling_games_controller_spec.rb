require 'rails_helper'

RSpec.describe Api::V1::BowlingGamesController, type: :controller do
  describe 'GET #index' do
    subject(:http_request) { get :index }

    context 'when get all bowling_game' do
      let!(:bowling_game) { create_list(:bowling_game, 3) }

      before do
        http_request
      end

      context 'validate state code' do
        it 'white responds ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'when valid the total bowling game' do
          expect(JSON(response.body).count).to be 3
        end
      end
    end
  end

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

  describe 'GET #show' do
    subject(:http_request) { get :show, params: params }

    let(:params) { { id: bowling_game.last.id } }

    context 'when valid a bowling game' do
      let!(:bowling_game) { create_list(:bowling_game, 3) }

      before { http_request }

      context 'validate state code' do
        it 'when responds ok' do
          expect(response).to have_http_status(:ok)
        end

        it 'when bowling game id is valid' do
          expect(JSON(response.body)['id']).to eq(params[:id])
        end
      end
    end
  end
end
