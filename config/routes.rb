Rails.application.routes.draw do

  get 'subjects/index'

  get 'subjects/show'

  get 'subjects/new'

  get 'subjects/edit'

  resources :courses, except: [:index] do
    resources :subjects do
      resources :lessons do
        resources :quizzes
      end
    end
  end
  resources :transictions, only: [:new, :create, :index, :show]
  resources :users, only: [] do
    resources :wallets, only: [:show]
  end
  resources :test_classes
  resources :contacts
  resources :blogs
  resources :dashboards, only: [:index]

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/home'
  root to: 'pages#home'

end
