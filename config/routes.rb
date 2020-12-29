Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create]
  resources :comments
  resources :likes
  resources :foods
  resources :drinks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
