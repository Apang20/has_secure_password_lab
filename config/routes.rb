Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create]
end
