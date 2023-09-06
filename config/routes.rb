Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "activities#index"

  devise_scope :user do
    get "/users/:id" => "users/sessions#show"
    get "/my_account" => "users/sessions#account"
  end

  resources :activities, only: %i[index show new create edit update] do
    get "/duplicate", to: "activities#duplicate"
    resources :registrations, only: :create
  end

  get "activities/my_activities", to: "activities#my_activities", as: :my_activities
  resources :registrations, only: :destroy
end
