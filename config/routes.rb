Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :new, :create, :show]
  resources :groups, only: [:index, :show]
  resources :weapons, only: [:index, :update]
  resources :supplies, only: [:index, :show]
  resources :owned_items, only: [:destroy]
  
  get '/zombie', to: 'users#edit'
  root 'application#hello'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  delete '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  

end
