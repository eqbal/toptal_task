ToptalTask::Application.routes.draw do
  
  get "search/index"
  post "search/create"
  
  resources :entries do 
  	get 'statistics', :on => :collection
    get 'edit', :on => :member
  end

  root "entries#index"    
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :entries do 
        get 'report', :on => :collection
        get 'search', :on => :collection           
      end
    end
  end	

end
