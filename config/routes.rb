LearnRails2::Application.routes.draw do

  #Questions
  #automatically makes seven routes for us
  resources :questions

  #Answers
  ## we can limit which routes are created using :only
  resources :answers, :only => [:create, :edit, :destroy]

  #Comments
  resources :comments, :only => [:create, :edit, :destroy]

  #Users
  ## define a custom url and tell it where to go
  ## in this case, the new method in the users controller
  resources :users
  match '/signup' => 'users#new'

  #Sessions
  ## :as gives us the ability to access this url in forms or links
  ## by saying login_path or login_url as opposed to explicityl
  get     '/login'  => 'sessions#new': :as => login
  post    '/login'  => 'sessions#create'
  delete  '/logout' => 'sessions#destroy', :via => :delete

  #Root
  ## specificies what gets called when you visit '/'
  root :to => 'questions#index'

end
