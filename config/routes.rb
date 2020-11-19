Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'bookings/:id/accept', to: 'bookings#accept', as: 'accept_booking'
  get 'bookings/:id/decline', to: 'bookings#decline', as: 'decline_booking'
  resources :yachts do
    resources :toys, only: [:create]
    resources :bookings, only: [:create, :index]
  end
  resources :bookings, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
