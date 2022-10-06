Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "home#index"

  namespace :admin do
    resources :products
    resources :product_categories
  end

  resources :products, only: [:index, :show]
  resources :product_categories, only: [:index, :show]

  resources :reviews, only: [:create]
end