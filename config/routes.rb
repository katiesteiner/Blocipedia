Rails.application.routes.draw do

  resources :wikis
  resources :charges, only: [:new, :create]
  resources :users, only: [:update] do
    post "downgrade"
    get "downgrade"
  end

  resources :collaborators

  devise_for :users

  get 'about' => 'welcome#about'

  authenticated :user do
    root 'wikis#index', as: :authenticated_root
  end

  root 'welcome#index'
end
