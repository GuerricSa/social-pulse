Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "activities#index"

  devise_scope :user do
    delete '/users/:id', to: "users/sessions#ban", as: :user_ban
    post '/users/:id/toggle_favorite', to: "users/sessions#toggle_favorite", as: :toggle_favorite_user
    get "/users/:id" => "users/sessions#show", as: :user
    get 'users/:user_id/reports/new', to: 'reports#new', as: :new_report
    post 'users/:user_id/reports', to: 'reports#create'

  end

  resources :activities, only: %i[index show new create edit update] do
    get "/duplicate", to: "activities#duplicate"
    resources :registrations, only: :create
    member do
      post 'toggle_favorite', to: "activities#toggle_favorite"
    end
  end

  get "my_activities", to: "activities#my_activities", as: :my_activities

  resources :registrations, only: :destroy

  resources :favorites, only: :index

  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end
end
