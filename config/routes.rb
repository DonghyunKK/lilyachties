Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'bookings/:id/accept', to: 'bookings#accept', as: 'accept_booking'
  get 'bookings/:id/decline', to: 'bookings#decline', as: 'decline_booking'
  resources :yachts do
    resources :toys, only: [:create]
    resources :bookings, only: [:create, :index]
    resources :reviews, only: :create
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
end
