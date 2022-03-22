# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'users/list', to: 'users#index'
  root 'main#index'
  resources :attendances
  get 'absent/members', to: 'attendances#absent_members'
  get 'mark/absent', to: 'attendances#absent_new'
  post 'mark/absent', to: 'attendances#absent_create'
  resources :main
  get 'checked_in', to: 'main#checked_in'
  get 'checked_out', to: 'main#checked_out'

  resources :conversations
  resources :messages
end
