Rails.application.routes.draw do
  root to: "travel_times#new"
  resources :travel_times, only: [:new, :create]
end
