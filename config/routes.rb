Rails.application.routes.draw do
  get 'users/:id/dashboard',to: 'users#dashboard', as: 'dashboard'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :events, only: [:new, :create]
  end
  resources :events, only: [:index, :show, :edit, :update, :destroy]
end
