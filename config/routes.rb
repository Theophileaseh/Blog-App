# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create, :new]
    end
  end

  namespace :api do 
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index show] do
          resources :comments, only: %i[index new create show] do
          end
        end
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
