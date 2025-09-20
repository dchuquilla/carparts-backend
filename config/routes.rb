Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "rails/health#show"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resource :profile, only: [ :show ]
      resources :uploads, only: [ :create, :show ]

      resources :requests do
        collection do
          get "details/:show_key", to: "requests#show", as: "details"
          get :filter, action: :index  # /api/v1/requests/filter uses the same index
        end
      end
      resources :stores, only: [ :show, :create, :update ] do
        collection do
          get "whatsapp-number/:phone", to: "stores#whatsapp_number", as: "whatsapp_number"
        end
      end
      resources :proposals, only: [ :index, :show, :create, :update, :destroy ] do
        member do
          patch "accept", to: "proposals#accept", as: "accept"
          patch "reject", to: "proposals#reject", as: "reject"
        end
      end
    end
  end
end
