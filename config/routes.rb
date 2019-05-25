Rails.application.routes.draw do

  get 'classrooms/index'

  resources :sales, only: [:index, :new, :create]
  resources :exchanges, only: [:new, :create]

  resources :attachments, only: [:new, :create]

  resources :courses, except: [:index, :edit, :update, :destroy], :path => "cursos" do
    resources :subjects, except: [:destroy], :path => "materia" do
      resources :lessons, except: [:destroy], :path => "aula" do
        resources :quizzes, except: [:destroy], :path => "quiz" do
          resources :questions, except: [:destroy], :path => "questao"
        end
      end
    end
  end

  resources :classrooms
  resources :questions, except: [:destroy]
  resources :user_answers, only: [:new, :create]
  resources :transictions, only: [:new, :create, :index, :show]
  resources :users, only: [:new, :create, :index] do
    resources :wallets, only: [:show], :path => "carteira"
  end
  resources :test_classes, except: [:edit, :update, :destroy, :new, :index], :path => "aula-gratis"
  get "/aula-gratis", to: "test_classes#new"
  resources :contacts, except: [:edit, :update, :destroy], :path => "contato"
  resources :blogs, except: [:destroy], :path => "blog"
  resources :dashboards, only: [:index]
  resources :tutorials
  resources :enrollments
  devise_for :users, :path => "usuario", controllers: {sessions: "sessions"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/home'
  get '/curso/:id', to: "courses#student_show", as: :student_show
  get '/rio-de-janeiro', to: "pages#rio_de_janeiro"
  get '/seja-um-franqueado', to: "pages#franchise"
  root to: 'pages#home'

end
