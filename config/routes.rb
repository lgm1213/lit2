Rails.application.routes.draw do
  post '/places/:id/rate' => 'places#rate'
  post '/rate' => 'rater#create', :as => 'rate'

  get 'welcome/index'
  root 'welcome#index'

  resources :categories
  resources :comments
  resources :ratings
  resources :places
  resources :users
  resources :welcomes


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/places' => 'welcome#index'


end
