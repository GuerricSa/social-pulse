Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "activities#index"

  devise_scope :user do
    get "/users/:id" => "users/sessions#show"
    get "/my_account" => "users/sessions#account"
    get '/edit_age' => "users/sessions#edit_age"
    get '/edit_first_name' => "users/sessions#edit_first_name"
    get '/edit_presentation' => "users/sessions#edit_presentation"
    get '/edit_avatar' => "users/sessions#edit_avatar"
    get '/edit_password' => "users/sessions#edit_password"
  end

  resources :activities, only: %i[index show new create edit update] do
    get "/duplicate", to: "activities#duplicate"
    resources :registrations, only: :create
    member do
      post 'toggle_favorite', to: "activities#toggle_favorite"
    end
  end

  get "activities/my_activities", to: "activities#my_activities", as: :my_activities

  resources :registrations, only: :destroy

  resources :favorites, only: :index
end
