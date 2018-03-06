Rails.application.routes.draw do

  get 'users/:id/dashboard',to: 'users#dashboard', as: 'dashboard'


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    get 'speaker/create', to: 'speakers#speaker_create'
    get 'speaker', to: 'speakers#speaker_show'
    get 'speaker/edit', to: 'speakers#speaker_edit'
    get 'speakers', to: 'speakers#speaker_index'
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
