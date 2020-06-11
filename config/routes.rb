# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :new, :create, :update]
  resources :records
  resources :groups 
  root 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
