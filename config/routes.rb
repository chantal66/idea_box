Rails.application.routes.draw do
  root to: 'welcome#index'

  # resources :ideas, only: [:index]

  resources :users, except: [:index] do
     resources :ideas, only: [:index, :new, :create, :show]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
