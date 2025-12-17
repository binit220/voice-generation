Rails.application.routes.draw do
  
  root "voice_requests#index"

  namespace :api do
    resources :voice_requests, only: [:index, :show]
    post "/generate_voice", to: "voice_requests#create"
  end
end
