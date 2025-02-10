Rails.application.routes.draw do
  # Page publique avant connexion
  root to: "home#index"

  # Gestion des utilisateurs avec Devise et OmniAuth
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # Redirection des utilisateurs authentifiés vers le dashboard
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  # Dashboard pour les utilisateurs connectés
  resources :dashboard, only: [ :index ]

  # Autres routes essentielles
  resources :payments, only: [ :create ]
  resources :classes, only: [ :index, :update ]
  resources :achievements, only: [ :index ]
  resources :animations, only: [ :index ]
  resources :users, only: [ :show, :update ]
  resources :leaderboards, only: [ :index ]
  resources :quests, only: [ :index, :update ]
  resources :events, only: [ :index ]
  resources :shop, only: [ :index, :create ]
end
