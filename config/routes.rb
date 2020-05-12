# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => { :sessions => "sessions" }
  get :cart, to: 'carts#show'
  resources :carts, only: %i[update destroy]
  resources :cart_products, only: %i[create update destroy]

  resources :products, only: %i[index show] do
    get :search, on: :collection
  end

  root 'products#index'
end
