Rails.application.routes.draw do

  resources :schools do
    resources :trainings, except: [:index]
  end
  resources :trainings, only: [:index]

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, only: [:edit] do
    resources :pictures, only: [:create]
  end
  
  resources :comments

  root 'staticpages#home'
  



  get "/staticpages" => "staticpages#guide"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
