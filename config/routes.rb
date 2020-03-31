Rails.application.routes.draw do
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :bowling_lanes
    resources :users
    resources :bowling_games, only: %i[index create show] do
      collection do
        put :points, to: 'bowling_games#update'
      end
    end
  end
end
