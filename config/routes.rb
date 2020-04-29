Rails.application.routes.draw do
  resources :offers
  get 'welcome/index'
  devise_for :users
  resources :users
  resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
