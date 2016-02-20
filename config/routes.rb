Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :landings
  resources :tweets
  resources :interacted_tweets
  resources :favourites
  resources :related_users

  namespace :users do
    resources :social_accounts
  end
end
