Rails.application.routes.draw do
  get "home/index"

  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'home#index'

  resources :projects do
    resources :materials
    resources :workers
  end

  get 'payment/new', to: 'payments#new', as: 'new_payment'         # Route for showing payment form
  post 'payment', to: 'payments#process_payment'                 # Route for processing payment
end