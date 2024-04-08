Rails.application.routes.draw do
  get 'sessions/new'
  get 'guilds/new'
  get 'guilds/edit'
  get 'pages/home'
  get 'pages/help'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'pages#home'

  resources :users
  resources :guilds
end
