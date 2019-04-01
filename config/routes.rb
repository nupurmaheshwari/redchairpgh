Rails.application.routes.draw do
<<<<<<< HEAD

  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search', to: 'home#search', as: :search

  # Authentication routes
  resources :sessions
  resources :users
  get 'users/new', to: 'users#new', as: :signup
  get 'user/edit', to: 'users#edit', as: :edit_current_user
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

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
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
>>>>>>> 03d3b8e4a1e6b11c52868e004db4c1f75b3816b9
