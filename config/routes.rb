Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names: {sign_in: "login",
    sign_out: "logout"},
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  namespace :admin do
    root "dogs#index"
    resources :categories
    resources :users
    resources :dogs
    resources :reviews
  end
  root "dogs#index"
  resources :users
  resources :dogs
  resources :reviews
  resources :favorites, only: [:create, :destroy, :index]
  resources :compares
  resources :events
end
