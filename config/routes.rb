Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'entry#show'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/about', to: 'about#show'

  #------------User---------------
  get '/register', to: 'users#new'
  scope :profile, as: :profile do
    get '/', to: 'users#show'
    get '/edit', to: 'users#edit'
  end

  get '/dashboard', to: 'dashboard#show', as: "dashboard"

  resources :users, only: [:create, :update] do
    resources :experiments, only: [:show, :index]
    resources :voles, only: [:show, :index]
  end

  #------------Admin User---------------
  namespace :admin do
    get '/dashboard', to: 'dashboard#show', as: "dashboard"
    put '/users/:id/enable', to: 'users#enable', as: :enable_user
    put '/users/:id/disable', to: 'users#disable', as: :disable_user
    resources :users, only: [:index, :show, :edit, :update]
  end

  resources :experiments, only: [:show, :index]
  resources :voles, only: [:show, :index]

end
