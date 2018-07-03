Rails.application.routes.draw do

  get 'users/:id/dashboard',to: 'users#dashboard', as: 'dashboard'
  get 'users/:id/inbox',to: 'users#inbox', as: 'inbox'
  get 'users/:user_id/inbox/:id', to: 'users#conversation', as: 'inbox_users'
  get 'speakers', to: 'speakers#speaker_index'
  get 'privacy_policy', to: 'pages#privacy_policy'
  get 'terms', to: 'pages#terms'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    resources :user_tags, only: [:create]
    patch 'speaker/create', to: 'speakers#speaker_create'
    get 'speaker/new', to: 'speakers#speaker_new'
    get 'speaker', to: 'speakers#speaker_show'
    get 'speaker/edit', to: 'speakers#speaker_edit'
    patch 'speaker/update', to: 'speakers#speaker_update'
    resources :user_bookings, only: [:index]
    resources :speaker_bookings, only: [:index]
    resources :messages, only: [:index, :new, :create]
    resources :invites, only: [:create]
    member do
      get 'messages/ajax'
    end
  end
  resources :user_tags, only: [:destroy]
  resources :events do
    resources :user_bookings, only: [:new, :create]
    resources :speaker_bookings, only: [:new, :create]
  end

  resources :user_bookings, only: [:destroy]

  resources :speaker_bookings, only: [:destroy]

  patch 'invite/accept/:id', to: 'invites#accept', as: 'invites_accept'
  patch 'invite/reject/:id', to: 'invites#reject', as: 'invites_reject'

  mount ActionCable.server => "/cable"
end

