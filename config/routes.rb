require 'sidekiq/web'
require "constraints/subdomain_required"

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'home#index'
  
  get "/accounts/new", to: "accounts#new", as: :new_account
  post "/accounts", to: "accounts#create", as: :accounts

  # Might not need this
  get "signed_out", to: "users#signed_out"
end
