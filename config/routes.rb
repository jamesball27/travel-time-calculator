Rails.application.routes.draw do
  root to: "travel_times#show"
  resources :travel_times, only: [:create]
end
