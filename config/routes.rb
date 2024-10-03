# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'

  resources :projects do
    resources :materials
    resources :workers
  end
end