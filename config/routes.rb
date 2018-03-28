Rails.application.routes.draw do

  resources :registered_applications, except: [:edit, :update]

  devise_for :users

  get 'welcome/index'

  root 'welcome#index'
end
