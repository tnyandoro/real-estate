Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/login', to: 'authentication#login'
    resources :students
    resources :courses
    resources :enrollments
    resources :certificates
    resources :teachers
    resources :enrollments, only: [:index, :show, :create, :destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
