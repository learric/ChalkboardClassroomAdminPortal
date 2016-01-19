Rails.application.routes.draw do
  root to: "static_pages#index"

  get 'games', to: 'games#index'
  get 'games/collegiate_rivals', to: 'games#collegiate_rivals'
  get 'games/questions', to: 'games#questions'

  devise_for :users

  resources :students
  resources :teachers
  resources :classrooms
  resources :questions
end
