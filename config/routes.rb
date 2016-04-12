Rails.application.routes.draw do
  devise_for :users
  root :to => 'projects#index'
  
  resources :dashboards
  
  resources :projects do
    member do
      get 'add_developer'
    end
    
    collection do
      post 'assign_developers'
    end
  end
  
  resources :tasks do
    collection do
      get 'update_status'
    end
  end
end
