Rails.application.routes.draw do

  get 'users/:id/dashboard',to: 'users#dashboard', as: 'dashboard'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :events, only: [:new, :create]
    resources :user_bookings, only: [:index]
    resources :speaker_bookings, only: [:index]
  end

  resources :events, only: [:index, :show, :edit, :update, :destroy] do
    resources :user_bookings, only: [:new, :create]
    resources :speaker_bookings, only: [:new, :create]
  end

  resources :user_bookings, only: [:destroy]

  resources :speaker_bookings, only: [:destroy]
end
