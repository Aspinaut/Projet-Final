Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  root 'trainings#index'
  resources :trainings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
