Rails.application.routes.draw do

  devise_for :users
  root 'trainings#index'
  resources :trainings
  get "/staticpages" => "staticpages#guide"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
