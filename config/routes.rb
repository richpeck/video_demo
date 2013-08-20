VideoDemo::Application.routes.draw do
  
  root :to => "members#index"
  resources :videos
  resources :profile, :path => '/profile', :path_names => { :edit => 'settings' }, :only => ['update'] do
    #resources :photos
  end

  get '/profile', to: 'users#index'
  
  devise_for :users
  devise_scope :user do
	get "/login" => "devise/sessions#create", :method => "get"
	get "/register" => "devise/registrations#new", :method => "get"
	get "/logout" => "devise/sessions#destroy", :method => "delete"
  end

  resources :users, :only => ['index', 'show'], :path_names => { :index => 'profile' }
  resources :members, :only => ['index', 'show'] 

end
