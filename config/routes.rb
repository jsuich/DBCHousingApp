DBCHousingApp::Application.routes.draw do


  resources :locations
  resources :users

  get '/login' => 'sessions#new'
  # this is for omni-auth tutorial
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  #this is our actual login route
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/map'  =>  'map#index'

  get '/grablocations' => 'map#grablocations'

  root :to => 'sessions#new'
end
