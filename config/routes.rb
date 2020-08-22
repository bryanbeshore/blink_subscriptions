require 'sidekiq/web'
require "constraints/subdomain_required"

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users
  constraints(SubdomainRequired) do
    scope module: "accounts" do
      root to: "dashboard#index", as: :account_root
      resources :dashboard, only: [:index]

      resources :invitations, only: [:new, :create] do
        member do
          get :accept
          patch :accepted
        end
      end
    end
  end


  root to: 'home#index'
  
  get "/accounts/new", to: "accounts#new", as: :new_account
  post "/accounts", to: "accounts#create", as: :accounts

  get "signed_out", to: "users#signed_out"
end
