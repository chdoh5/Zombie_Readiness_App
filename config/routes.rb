Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :new, :create, :show]
  resources :groups, only: [:index, :show]
  resources :weapons, only: [:index]
  resources :supplies, only: [:index, :show]

  root 'application#welcome'


end
