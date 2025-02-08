Rails.application.routes.draw do
  get "leaderboards/index"
  get "users/show"
  get "users/update"
  get "animations/index"
  get "achievements/index"
  get "classes/index"
  get "classes/update"
  get "events/index"
  get "payments/create"
  root "dashboard#index"
  resources :sessions, only: [ :new, :create ]
  resources :quests, only: [ :index, :update ]
  resources :users, only: [ :show, :update ]
  resources :shop, only: [ :index ] do
    post "purchase", on: :collection
  end
  resources :payments, only: [ :create ]
  resources :classes, only: [ :index, :update ]
  resources :achievements, only: [ :index ]
  resources :animations, only: [ :index ]
  resources :leaderboards, only: [ :index ]
end
