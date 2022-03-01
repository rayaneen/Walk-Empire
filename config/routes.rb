Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:edit, :update ] do
    resources :activities, only: [:new, :create]
  end
  resources :control_points, only: [:index, :show]
end
