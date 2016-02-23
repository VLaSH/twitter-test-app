Rails.application.routes.draw do
  root to: 'landings#index'

  namespace :users do
    resources :social_accounts, only: :create
    resources :pages, only: :index
    resource :profiles, only: :update
  end
  resources :comments, except: [:new, :edit, :show]
  resources :users, except: [:edit, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :landings, only: :index
  resources :tweets, only: [:create, :update, :destroy]
  resources :interacted_tweets, only: [:index, :create, :destroy]
  resources :favourites, only: :index
  resources :related_users, only: [:index, :create, :destroy]
  resources :email_confirmations, only: :confirm do
    get :confirm
  end
  resources :restore_passwords, only: [:new, :restore, :create, :update] do
    get :restore
  end

  get '/auth/:provider/callback', to: 'users/social_accounts#create'
  get '/auth/failure', to: 'landings#index'
  get '*path', to: 'landings#index'
end
