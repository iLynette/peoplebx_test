Rails.application.routes.draw do
  resources :appointments do
    resources :bookings
    # get :available_slots, on: :collection
    # resource :available_slots, only: [:show], controller: :available_slots
  end

  get "book/*email", to: "available_slots#show"

  resource :appointment_duration, only: [:create], controller: :appointment_duration

  devise_for :users

  root to: "available_slots#show"

  # root to: "appointments#index"
end