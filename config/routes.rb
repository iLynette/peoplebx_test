Rails.application.routes.draw do
  resources :appointments do
    resources :bookings
    get :available_slots, on: :collection
  end

  devise_for :users

  root to: "appointments#index"
end
