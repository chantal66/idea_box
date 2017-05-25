Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :ideas, only: [:index]

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:create, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
