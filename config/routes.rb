Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup-attempt', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :match_players
  resources :fixture_teams
  resources :matches
  resources :fixtures, only: [:index, :show]
  resources :players
  resources :teams
  resources :colleges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
