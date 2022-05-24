Rails.application.routes.draw do
  devise_for :users
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

  # section Api
  namespace :api do
    namespace :v1 do
      namespace :mobile do
        post 'sign_up', to: 'auth#sign_up'
        post 'log_out', to: 'auth#log_out'
        post 'check_uid', to: 'auth#check_uid'
        get 'events', to: 'events#events'
        get 'groups', to: 'groups#groups'
        get 'activities', to: 'activity#activities'
        get 'extrapoints', to: 'extra_point#extrapoints'
        get 'sanctions', to: 'sanction#sanctions'

      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
