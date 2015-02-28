Rails.application.routes.draw do
  devise_for :employees

  root 'dashboard#index'

  resources :activities

  namespace :admin do
    resources :employees

    scope 'panel', controller: :panel do
      get '', action: :index
    end
  end
end
