# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: %i[index show] do
    get :search, on: :collection
  end

  root 'products#index'
end
