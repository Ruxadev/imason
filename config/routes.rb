# config/routes.rb
Rails.application.routes.draw do
  root 'projects#index'
  devise_for :users
  delete '/users/sign_out', to: 'application#destroy', as: :sign_out
  resources :projects do
    resources :materials
    resources :workers
  end
  resources :materials
  resources :workers
end