Rails.application.routes.draw do

  root to: "games#index"

  get 'games', to: 'games#index'
  get 'games/collegiate_rivals', to: 'games#collegiate_rivals'

  get 'profiles', to: 'profiles#show'
  get 'profiles/:id', to: 'profiles#show'
  get 'profiles/:id/edit', to: 'profiles#edit'

  get 'schools/teachers', to: 'schools#teachers'
  get 'schools/students', to: 'schools#students'

  get 'questions/classroom/:id', to: 'questions#classroom', as: 'classroom_questions'
  get 'questions/classroom/:id/new', to: 'questions#new', as: 'new_classroom_question'
  post 'questions/classroom/:classroom_id', to: 'questions#create'

  post 'classrooms/add_student', to: 'classrooms#add_student', as: 'classroom_add_student'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  resources :schools
  resources :classrooms
  resources :questions
end
