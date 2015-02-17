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
  # This redirect to root if route can not be found.
  #get '*path' => redirect('/')


  #ROUTES FOR API
=begin
  scope :api do
    scope :v1 do
  resources :event, :defaults => { :format => 'json' } do
    resources :position
    resources :tag
    resources :creator
  end
  end
  end
=end
  scope :api do
    scope :v1 do
      resources :event , :defaults => { :format => 'json' } do
      end
    end
  end
end
