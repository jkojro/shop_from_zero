# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: [:index, :show]
  resources :carts, only: [:update, :show, :destroy]

  get '/search' => 'products#search'

  root 'products#index'
end
