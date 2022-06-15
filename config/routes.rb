Rails.application.routes.draw do

  root to: "welcome#index"
  resources :parameters
  resources :group_extra_points
  resources :extra_points
  resources :group_sanctions
  resources :sanctions
  # resources :users
  resources :group_activities
  resources :activities
  resources :people
  resources :groups
  resources :events do
    member do
      get 'event_groups'
    end
  end

  get 'welcome/index'

  devise_for :users , controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    #get '/users/sign_out' => 'sessions#destroy'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  #, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # devise_scope :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
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
        get 'my_activities', to: 'activity#my_activities'
        get 'extrapoints', to: 'extra_point#extrapoints'
        get 'sanctions', to: 'sanction#sanctions'
        get 'my_sanctions', to: 'sanction#my_sanctions'

      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
