Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
    #... any other controllers you want to customize
  }

  resources :categories
  resources :philosophers
  resources :quotes do
    collection do
      get 'search'
    end
  end


  namespace :admin do
    #devise_for :users, class_name: "User"
    resources :users
    resources :quotes
    resources :philosophers
    resources :categories
    get '/', to: 'dashboard#users'
  end
  

  # Defines the root path route ("/")
  root to: 'quotes#index'
end