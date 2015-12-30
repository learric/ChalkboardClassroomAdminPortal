Rails.application.routes.draw do
  get 'games', to: 'games#index'

  get 'games/questions', to: 'games#questions'

  devise_for :users
  root to: "static_pages#index"
  resources :teachers
  resources :questions
end
