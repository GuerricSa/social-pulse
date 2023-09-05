Rails.application.routes.draw do
  devise_for :users
  root "activities#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  resources :activities, only: %i[index show new create edit update] do
    get "/duplicate", to: "activities#duplicate"
  end

  get "activities/my_activities", to: "activities#my_activities", as: :my_activities
end
