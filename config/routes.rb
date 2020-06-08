# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  resource :cart, only: [:show, :update, :destroy]
  resources :cart_products, only: %i[create update destroy]
  resources :products, only: %i[index show] do
    get :search, on: :collection
  end

  resources :orders, only: %i[new create update show] do
    resources :addresses, only: %i[create]
    resource :delivery_method, only: %i[new create]
    resource :payment_method, only: %i[new create]

  end

  root 'products#index'
end
