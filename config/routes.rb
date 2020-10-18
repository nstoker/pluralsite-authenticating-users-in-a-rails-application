# frozen_string_literal: true

Rails.application.routes.draw do
  get 'password/reset'
  post 'password/reset'
  get 'password/forgot'
  post 'password/forgot'
  resources :users
  get 'users/new'
  get 'users/create'
  get 'home/index'
  get 'home/login'
  post 'home/login'
  get 'home/logout'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
