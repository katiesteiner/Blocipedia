Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :users, only: [:update] do
    post "downgrade"
    get "downgrade"
  end

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
