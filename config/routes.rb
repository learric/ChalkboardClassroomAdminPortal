Rails.application.routes.draw do

  root to: "games#index"

  get 'games', to: 'games#index'
  get 'games/collegiate_rivals', to: 'games#collegiate_rivals'

  get 'profiles', to: 'profiles#show'
  get 'profiles/:id', to: 'profiles#show'
  get 'profiles/:id/edit', to: 'profiles#edit'

  get 'schools/teachers', to: 'schools#teachers'
  get 'schools/students', to: 'schools#students'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  resources :schools
  resources :classrooms
  resources :questions
end
