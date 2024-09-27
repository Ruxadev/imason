# config/routes.rb
Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Set the root path to Devise's sign_in page
  authenticated :user do
    # When user is logged in, redirect to projects index page
    root to: 'projects#index', as: :authenticated_root
  end

  # When user is not logged in, redirect to the Devise sign-in page
  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end

  # Resources for other parts of the application
  resources :projects do
    resources :materials, only: [:index, :new, :create] # Nested resources for better organization
    resources :workers, only: [:index, :new, :create]
  end
  resources :materials, except: [:index, :new, :create]
  resources :workers, except: [:index, :new, :create]
end
