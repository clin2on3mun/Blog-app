# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth',
              path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resource :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"

end
