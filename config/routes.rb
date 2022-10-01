Rails.application.routes.draw do
  root to: "home#index"

  namespace :admin do
    resources :products
    resources :product_categories
  end

  resources :products, only: [:index, :show]
  resources :product_categories, only: [:index, :show]
end