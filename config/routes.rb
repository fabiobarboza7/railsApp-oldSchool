Rails.application.routes.draw do

  resources :courses, except: [:index, :edit, :update, :destroy] do
    resources :subjects, except: [:destroy] do
      resources :lessons, except: [:destroy] do
        resources :quizzes, except: [:destroy] do
          resources :questions, except: [:destroy]
        end
      end
    end
  end

  resources :questions, except: [:destroy]
  resources :user_answers, only: [:new, :create]
  resources :transictions, only: [:new, :create, :index, :show]
  resources :users, only: [] do
    resources :wallets, only: [:show]
  end
  resources :test_classes, except: [:edit, :update, :destroy]
  resources :contacts, except: [:edit, :update, :destroy]
  resources :blogs, except: [:destroy]
  resources :dashboards, only: [:index]

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/home'
  root to: 'pages#home'

end
