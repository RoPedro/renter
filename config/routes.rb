Rails.application.routes.draw do
  root 'welcome#index'
  
  resources :welcome
  resources :manufacturers do
    member do
      post :archive
      post :unarchive
    end
    collection do
      get :archived
    end
  end
  resources :cars
  resources :rental_cars
  resources :clients
  resources :orders do
    member do
      post :return
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
