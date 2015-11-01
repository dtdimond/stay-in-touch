StayInTouch::Application.routes.draw do
  #Main routes
  root to: 'pages#front'
  get '/home', to: 'contacts#index'

  #Contacts
  resources :contacts, except: [:destroy]

  #Session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #Users
  get '/register', to: 'users#new'
  resources :users, only: [:create, :show, :edit]

  #Static ui
  get 'ui(/:action)', controller: 'ui'
end
