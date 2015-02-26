Rails.application.routes.draw do
  devise_for :employees

  root 'dashboard#index'

  resources :activities
end
