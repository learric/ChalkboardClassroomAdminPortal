Rails.application.routes.draw do
  resources :classrooms
  root to: "static_pages#index"

  get 'games', to: 'games#index'
  get 'games/questions', to: 'games#questions'

  devise_for :users

  resources :students
  resources :teachers
  resources :questions
end
