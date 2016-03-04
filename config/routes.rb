Rails.application.routes.draw do

  root to: 'games#index'

  get 'games', to: 'games#index'
  get 'games/game_session', to: 'games#game_session'
  get 'games/game_session_questions/:id', to: 'games#game_session_questions'
  get 'games/collegiate_rivals', to: 'games#collegiate_rivals'

  get 'profiles', to: 'profiles#show'
  get 'profiles/:id', to: 'profiles#show'
  get 'profiles/:id/edit', to: 'profiles#edit'

  get 'schools/teachers', to: 'schools#teachers'
  get 'schools/students', to: 'schools#students'
  get 'schools/new_user', to: 'schools#new_user', as: 'school_new_user'
  get 'schools/edit_user/:id', to: 'schools#edit_user', as: 'school_edit_user'
  post 'schools/new_user', to: 'schools#create_new_user'
  patch 'schools/edit_user/:id', to: 'schools#update_user', as: 'school_update_user'
  delete 'schools/new_user/:id', to: 'schools#delete_user', as: 'school_delete_user'

  get 'questions/classroom/:id', to: 'questions#classroom', as: 'classroom_questions'
  get 'questions/classroom/:id/new', to: 'questions#new', as: 'new_classroom_question'
  post 'questions/classroom/:classroom_id', to: 'questions#create', as: 'create_new_classroom_question'

  get 'classroom_users/classroom/:id', to: 'classroom_users#index', as: 'classroom_users_class'
  post 'classroom_users/classroom/:id', to: 'classroom_users#create', as: 'classroom_users_add'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  resources :schools
  resources :classrooms
  resources :questions
  resources :classroom_users
end
