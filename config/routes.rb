# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: [:index, :show, :update]
  resources :carts, only: [:update, :show]

  get '/search' => 'products#search'

  root 'products#index'
end
