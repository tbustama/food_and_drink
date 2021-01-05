Rails.application.routes.draw do
  root to: 'users#home'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:create]
  resources :comments
  # haven't needed this yet ==> resources :likes
  post 'foods/:id/likes/:id', to: 'likes#create_food_like', as: 'like_food'
  post 'drinks/:id/likes/:id', to: 'likes#create_drink_like', as: 'like_drink'
  get 'random_food', to: 'foods#random', as: 'random_food'
  get 'random_drink', to: 'drinks#random', as: 'random_drink'
  resources :foods do 
    resources :likes 
  end 
  resources :drinks do 
    resources :likes 
  end 
  resources :users
end
