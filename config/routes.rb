# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  post '/uploads', to: 'pages#uploads'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
