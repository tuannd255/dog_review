Rails.application.routes.draw do
  devise_for :users, path: "auth", path_names: {sign_in: "login",
    sign_out: "logout"},
    controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  namespace :admin do
    root "dogs#index"
    resources :categories
    resources :users
    resources :dogs
  end
  root "dogs#index"
  resources :users
  resources :dogs
end
