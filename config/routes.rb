VideoDemo::Application.routes.draw do
  
  root :to => "members#index"
  resources :videos
  
  get '/users', to: 'users#index'
  get '/members', to: 'members#index'
  devise_for :users
  devise_scope :user do
	get "/login" => "devise/sessions#create", :method => "get"
	get "/register" => "devise/registrations#new", :method => "get"
	get "/logout" => "devise/sessions#destroy", :method => "delete"
  end
  
end
