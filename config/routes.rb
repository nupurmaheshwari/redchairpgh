Rails.application.routes.draw do

  #devise_for :users
  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search

  # LinkedIn authentication routes 
  get '/auth/linkedin/callback' => 'sessions#create'
  
  # Authentication routes
  #resources :sessions
  #resources :users
  #get 'users/new', to: 'users#new', as: :signup
  #get 'user/edit', to: 'users#edit', as: :edit_current_user
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"

  #resources :users, :only => [:new, :create]

  # Resource routes (maps HTTP verbs to controller actions automatically):
  resources :mentees
  resources :mentors
  resources :mentorships

  # Routes for searching
  get 'mentees/search', to: 'mentees#search', as: :mentees_search
  get 'mentors/search', to: 'mentors#search', as: :mentors_search
  get 'users/search', to: 'users#search', as: :users_search

  # You can have the root of your site routed with 'root'
  root 'home#index'
end