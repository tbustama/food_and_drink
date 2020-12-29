Rails.application.routes.draw do
  root to: 'users#home'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create]
  resources :comments
  resources :likes
  # put 'foods/:id/like' to: 'foods#like', as: 'like'
  # put 'drinks/:id/like' to: 'drinks#like', as: 'like'
  resources :foods
  resources :drinks
  resources :users
end
