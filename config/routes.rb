Rails.application.routes.draw do

  resources :admin
  resources :schools do
    resources :trainings, except: [:index]
  end
  resources :trainings, only: [:index]

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, only: [:edit] do
    resources :pictures, only: [:create]
  end
  root 'trainings#index'
  resources :comments

  get "/staticpages" => "staticpages#guide"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
