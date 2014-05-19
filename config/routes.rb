ToptalTask::Application.routes.draw do
  
  resources :entries do 
  	get 'statistics', :on => :collection
  end

  root "entries#index"    
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end

  # namespace :api do
  #   namespace :v1 do
	 #    post   'registrations' => 'registrations#create', :as => 'register'
	 #    post   'sessions' => 'sessions#create', :as => 'login'
	 #    delete 'sessions' => 'sessions#destroy', :as => 'logout'
	 #    get    'test'     => 'test#index', :as => 'test'
  #   end
  # end	

end
