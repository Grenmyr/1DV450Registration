Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'session#new' #page for a new session (login)
  post 'login' => 'session#create' # create a new session (login)
  delete 'logout' => 'session#destroy' #delete a session (log out)
  resources :users,only: [:index, :show, :new, :update, :create, :edit, :destroy] do
    resources :apis, only: [:edit]
  end
  get '/api/login' => 'apis#api_login', :defaults => { :format => 'json' }
  # This redirect to root if route can not be found.
  #get '*path' => redirect('/')


  #ROUTES FOR API
    namespace :api do
      namespace :v1 , :defaults => { :format => 'json' } do
      resources :events
      get '/positions/geocoder' => 'positions#geocoder'
      resources :positions
      resources :types
      get '/types/:id/events' => 'events#find_by_type'
      resources :creators
      get '/creators/:id/events' => 'events#find_by_creator'
      end
    end
end
