Rails.application.routes.draw do
  devise_for :users
  root to: 'control_points#index'
  resources :control_points, only: [:index, :show]
  resources :users, only: [:edit, :update ] do
    resources :activities, only: [:new, :create]
  end
end
