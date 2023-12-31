# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root 'users#index'

  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resource :likes, only: [:create]
    end
  end

  namespace :api, defaults: { format: 'json' } do
    resources :users, only: [:show] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end    
    end
  
  
    
  # Defines the root path route ("/")
  # root "articles#index"

end
