# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  resources :likes
  resources :posts
  resources :users
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
      #comments
      #likes
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
