Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'welcome#index', as: "welcome"

  root 'sessions#new', as: 'login'
  post '/', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  #------------User---------------
  get '/register', to: 'users#new'
  scope :dashboard, as: :dashboard do
    get '/', to: 'users#show'
    get '/edit', to: 'users#edit'
  end

  resources :users, only: [:create, :update]

  namespace :admin do
    put '/users/:id/enable', to: 'users#enable', as: :enable_user
    put '/users/:id/disable', to: 'users#disable', as: :disable_user
    resources :users, only: [:index, :show, :edit, :update]
    resources :dashboard, only: [:show, :edit, :update]
  end

end
