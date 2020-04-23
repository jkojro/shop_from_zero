# frozen_string_literal: true

Rails.application.routes.draw do
  resources :carts, only: [:update, :show, :destroy]
  resources :cart_products, only: [:create, :update, :destroy]

  resources :products, only: %i[index show] do
    get :search, on: :collection
  end

  root 'products#index'
end
