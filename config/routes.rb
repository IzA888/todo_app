Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/tasks', to: 'task#index'
  get '/tasks/new', to: 'task#new'
  get '/tasks/:id', to: 'task#show'
  post '/tasks', to: 'task#create'
  get '/tasks/:id/edit', to: 'task#edit'
  patch '/tasks/:id', to: 'task#update'
  delete '/tasks/:id', to: 'task#destroy'
  delete '/tasks', to: 'task#destroy_all'

  get '/user', to: 'user#index'
  get '/user/new', to: 'user#new'
  get '/user/:id', to: 'user#show'
  post '/user', to: 'user#create'
  get '/user/:id/edit', to: 'user#edit'
  patch '/user/:id', to: 'user#update'
  delete '/user/:id', to: 'user#destroy'
  delete '/user', to: 'user#destroy_all'
  put '/user/login', to: 'user#login'
end
