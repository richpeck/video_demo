VideoDemo::Application.routes.draw do
  
  root :to => "members#index"
  
  devise_for :users
  devise_scope :user do
	get "/login" => "devise/sessions#create", :method => "get"
	get "/register" => "devise/registrations#new", :method => "get"
	get "/logout" => "devise/sessions#destroy", :method => "delete"
  end

  resources :profile, :only => ['update']
   
  resources :users, :only => ['index', 'show'] do
	resources :schedules, :only => ['index'] do
		resources :bookings, :only => ['create'], :path_names => { create: 'book' }
	end
	resources :categories, :only => ['update', 'destroy']
  end
  resources :videos
  resources :members, :only => ['index', 'show']
  resources :portfolio, :only => ['create', 'update', 'destroy']
  resources :schedules, :only => ['create', 'update', 'destroy']
  #resources :bookings, :only => ['update', 'destroy']


end
