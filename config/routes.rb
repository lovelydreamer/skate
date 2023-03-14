# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'home#index'

  namespace :admin do
    resources :products
    resources :product_categories
  end

  resources :analytics, only: [:index]

  resources :brand, only: [:index]
  resources :carts, only: %i[index show edit update destroy]
  resources :checkout, only: [:create]

  resources :products, only: %i[index show]
  resources :product_categories, only: %i[index show]
  resources :search, only: [:index]
  resources :reviews, only: %i[show create]
end
