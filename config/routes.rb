VideoDemo::Application.routes.draw do
  devise_for :users
  
  root :to => "videos#index"
  resources :videos
  
end
