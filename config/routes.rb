Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/dashboard', to: 'users#show'
  # resources :users, only: [:new, :create]
end
