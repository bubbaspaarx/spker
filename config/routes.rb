Rails.application.routes.draw do

  get 'users/:id/dashboard',to: 'users#dashboard', as: 'dashboard'
  get 'users/:id/inbox',to: 'users#inbox', as: 'inbox'
  get 'users/:user_id/inbox/:id', to: 'users#conversation', as: 'inbox_users'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :events, only: [:new, :create, :edit, :update]
    resources :user_bookings, only: [:index]
    resources :speaker_bookings, only: [:index]
    resources :messages, only: [:index, :new, :create]
  end

  resources :events, only: [:index, :show, :destroy] do
    resources :user_bookings, only: [:new, :create]
    resources :speaker_bookings, only: [:new, :create]
  end

  resources :user_bookings, only: [:destroy]

  resources :speaker_bookings, only: [:destroy]
end
