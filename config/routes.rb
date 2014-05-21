ToptalTask::Application.routes.draw do
  
  get "search/index"
  post "search/create"
  
  resources :entries do 
  	get 'statistics', :on => :collection
  end

  root "entries#index"    
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :entries
	    # post   'registrations' => 'registrations#create', :as => 'register'
	    # post   'sessions' => 'sessions#create', :as => 'login'
	    # delete 'sessions' => 'sessions#destroy', :as => 'logout'
	    # get    'test'     => 'test#index', :as => 'test'
    end
  end	

end
