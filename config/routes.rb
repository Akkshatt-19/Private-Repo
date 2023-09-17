Rails.application.routes.draw do
  resources :users do
    collection do
      post 'login', to: 'authentication#login'
    end
  end
  
  resources :hospitals do
    collection do
      get 'search_hospital_name', to: 'hospitals#search_hospital_name'
    end
  end
  
  resources :test_centers do
    collection do
      get 'search_name', to: 'test_centers#search_name'
      get 'search_location', to: 'test_centers#search_location'
    end
  end
  
  resources :reviews
  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  
  resources :appointments do
    member do
      post 'update_status', to: 'appointments#update_status'
    end
    
    collection do
      post 'appoint_test_centers', to: 'appointments#appoint_test_centers'
    end
  end
end
