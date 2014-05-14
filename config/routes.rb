ToptalTask::Application.routes.draw do
  resources :entries

  root "entries#index"    
  
    
  devise_for :users
  
  namespace :admin do
    root "base#index"
    resources :users
  end
  
end
