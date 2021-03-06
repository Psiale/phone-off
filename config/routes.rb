# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[show new create update]
  resources :records
  get 'index_no_group', to: 'records#index_no_group', as: :index_no_group
  resources :groups
  resources :record_groups, except: %i[edit update]
  root 'records#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
