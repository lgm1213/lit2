Rails.application.routes.draw do
  resources :sessions, only: [:create, :destroy]
  resources :categories
  resources :comments
  resources :ratings
  resources :places
  resources :users
  resources :welcomes

  get 'welcome/index'
  root 'welcome#index'
  #facebook sign in
  # get 'auth/:provider/:callback', to: "sessions#create"
  #facebook logout
  # get 'signout', to: "sessions#destroy", as: sign_out

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  get '/places' => 'welcome#index'
  post '/places/:id/rate' => 'places#rate'
  
  post '/get_users_id' => 'users#get_users_id'
  get '/signup' => 'users#new'

  post '/users' => 'users#create'

  post '/ratings' => 'ratings#create', :as => 'rate'

  # get 'auth/facebook/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')
  # get 'signout', to: 'sessions#destroy', as: 'signout'

end




  

