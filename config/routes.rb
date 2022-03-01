Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:edit, :update ] do
    resources :activities, only: [:new, :create]
  end
  # Pas de routes control points pour l'instant
  # Pas sur pour ça mais dans l'idée, l'user ne peut pas y toucher donc pas besoin?
end
