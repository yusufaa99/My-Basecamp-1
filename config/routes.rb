Rails.application.routes.draw do
  get "dashboards/user"
devise_for :users

# resources :users, only: [:index] do
#   member do
#     patch :set_admin
#     patch :remove_admin
#   end
# end

  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :projects, only: [:index, :edit, :update, :destroy]
  end

  root 'home#index'  # Set Home as the root route

  get 'about', to: 'about#index'

  get 'service', to: 'service#index'

  get 'pricing', to: 'pricing#index'

   # User Dashboard
  get 'user_dashboard', to: 'dashboards#user', as: 'user_dashboard'

  resources :projects

#   resources :notifications, only: [:index, :show]
# namespace :admin do
#   resources :notifications, except: [:index]
# end

# resources :notifications, only: [:index, :new, :create]
# resources :notifications, only: [:index, :new, :create, :show]
# namespace :admin do
#   resources :notifications, except: [:index, :show]
# end
resources :notifications

  # devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
