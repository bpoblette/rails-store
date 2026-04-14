Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # 4 CRUD Actions (Create, Read, Update Delete)
  # translates to 8 typical routes
  # # Index
  # get "/products", to: "products#index"
  # # New
  # get "/products/new", to: "products#new"
  # # Create
  # post "/products", to: "products#create"
  # # Show
  # get "/products/:id", to: "products#show"
  # # Edit
  # get "/products/:id:edit", to: "products#edit"
  # # Update (full) PUT
  # put "/products/:id", to: "products#update"
  # # Update (partial) Patch
  # patch "/products/:id", to: "products#update"
  # # Destroy
  # delete "/products/:id", to: "products#destroy"

  # typing all these routes is redundant
  # this does the same thing
  root "products#index"
  resources :products do
    resources :subscribers, only: [ :create ]
  end
end
