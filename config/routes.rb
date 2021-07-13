Rails.application.routes.draw do
  resources :users
  resources :match_players
  resources :fixture_teams
  resources :matches
  resources :fixtures
  resources :players
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
