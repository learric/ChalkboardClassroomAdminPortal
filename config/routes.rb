Rails.application.routes.draw do
  devise_for :users
  root to: "questions#index"
  resources :teachers
  resources :questions
end
