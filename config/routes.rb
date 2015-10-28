PostitTemplate::Application.routes.draw do
  root to: 'pages#front'

  resources :contacts, except: [:destroy]

  #Session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #Users
  get '/register', to: 'users#new'
  resources :users, only: [:create, :show, :edit, :update]

  get 'ui(/:action)', controller: 'ui'
end
