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
  
end
