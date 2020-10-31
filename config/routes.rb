Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to:'pages#about'
  resources :movies
  get 'signup', to:'users#new'
  resources :users,except: [:new]
  get 'login',to: 'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
  get 'search', to: 'movies#search'
  resources :showtimes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

