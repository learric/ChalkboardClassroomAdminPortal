Rails.application.routes.draw do

  root to: "static_pages#index"

  get 'games', to: 'games#index'
  get 'games/collegiate_rivals', to: 'games#collegiate_rivals'

  devise_for :users
  resources :schools
end
