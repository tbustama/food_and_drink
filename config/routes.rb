Rails.application.routes.draw do
  root to: 'users#home'
  resources :comments
  resources :likes
  resources :foods
  resources :drinks
  resources :users
end
