# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  get :cart, to: 'carts#show'
  patch :cart, to: 'carts#update'
  delete :cart, to: 'carts#destroy'

  resources :cart_products, only: :create

  resources :products, only: %i[index show] do
    get :search, on: :collection
  end

  root 'products#index'
end
