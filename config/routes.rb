Rails.application.routes.draw do
  devise_for :subscribers
  resources :subscribers
  resources :needs
  resources :offers
  get 'welcome/index'
  devise_for :users
  resources :users
  resources :organizations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  namespace :v1, defaults: { format: :json } do
    resources :subscribers, only: %i[create update show]
    resource :subscriber_sessions, only: %i[create destroy show]
    resources :organizations, only: %i[index show]
  end
end
