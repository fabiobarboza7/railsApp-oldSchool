Rails.application.routes.draw do

  resources :courses, except: [:index]
  resources :test_classes
  resources :contacts
  resources :blogs
  resources :dashboards, only: [:index]

  devise_for :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/home'
  root to: 'pages#home'

end
