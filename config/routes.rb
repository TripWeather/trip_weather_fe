Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  # resources :users, only: [:new, :create]

  get '/trips', to: 'trips#index'
  post '/trips', to: 'trips#create'
  get '/trips/new', to: 'trips#new'
  get '/trips/:id', to: 'trips#show'
  delete '/trips/:id', to: 'trips#destroy'
  get '/trips/:id/edit', to: 'trips#edit'
  put '/trips/:id', to: 'trips#update'
end
