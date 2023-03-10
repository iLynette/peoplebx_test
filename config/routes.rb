# frozen_string_literal: true

Rails.application.routes.draw do
  resources :appointments do
    resources :bookings
  end

  namespace :api, defaults: { format: 'json' } do
    resources :appointments do
      resources :bookings
    end
  end

  get 'book/*email', to: 'available_slots#show'

  resource :appointment_duration, only: [:create], controller: :appointment_duration

  devise_for :users

  root to: 'appointments#index'
end
