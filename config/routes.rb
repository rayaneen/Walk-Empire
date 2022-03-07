Rails.application.routes.draw do
  devise_for :users
  root to: 'control_points#index'
  resources :control_points, only: [:index, :show] do
  resources :activities, only: [:new, :create, :show, :update]

  end
  resources :users, only: [:edit, :update ]
  resources :activities, only: [:destroy]
end
