VideoDemo::Application.routes.draw do
  
  root :to => "members#index"
  get '/profile', to: 'users#index'
  
  devise_for :users
  devise_scope :user do
	get "/login" => "devise/sessions#create", :method => "get"
	get "/register" => "devise/registrations#new", :method => "get"
	get "/logout" => "devise/sessions#destroy", :method => "delete"
  end

  resources :videos
  resources :profile, :path => '/profile', :path_names => { :edit => 'settings' }, :only => ['update'] do
    #resources :photos
  end
  
  resources :users, :only => ['index', 'show'], :path_names => { index: 'profile' } do
	resources :schedules, :only => ['index'] do
		resources :bookings, :only => ['create'], :path_names => { create: 'book' }
	end
  end
  resources :members, :only => ['index', 'show'] 
  resources :portfolio, :only => ['create', 'update', 'destroy']
  resources :schedules, :only => ['create', 'update', 'destroy']
  #resources :bookings, :only => ['update', 'destroy']

end
