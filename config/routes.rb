# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: %i[index show]

  get '/search' => 'products#search'

  root 'products#index'
end
