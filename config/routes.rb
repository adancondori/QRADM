Rails.application.routes.draw do
  root to: "welcome#index"
  resources :parameters
  resources :group_extra_points
  resources :extra_points
  resources :group_sanctions
  resources :sanctions
  resources :users
  resources :group_activities
  resources :activities
  resources :people
  resources :groups
  resources :events
  get 'welcome/index'

  mount API::Base, at: "/"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
