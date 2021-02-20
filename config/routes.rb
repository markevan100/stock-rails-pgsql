Rails.application.routes.draw do
  scope module: :api, constraints: { format: :json } do
    namespace :v1 do
      resources :stocks, only: %i[index create destroy update show]
    end
  end
end
