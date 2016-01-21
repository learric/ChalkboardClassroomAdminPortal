Rails.application.routes.draw do
  root to: "static_pages#index"

  get 'games', to: 'games#index'
  get 'games/collegiate_rivals', to: 'games#collegiate_rivals'
  get 'games/teachers', to: 'games#teachers'
  get 'games/questions/:teacher', to: 'games#questions'

  devise_for :users

  resources :students
  resources :teachers
  resources :classrooms
  resources :questions
end
