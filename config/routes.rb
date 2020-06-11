# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resource :cart, only: [:show, :update, :destroy]
  resources :cart_products, only: %i[create update destroy]
  resources :products, only: %i[index show] do
    get :search, on: :collection
  end

  root 'products#index'
end
