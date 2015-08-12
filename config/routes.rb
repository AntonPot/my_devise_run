Rails.application.routes.draw do
  # get 'surveys/new'

  root "surveys#index"
  resources :surveys
  devise_for :users
end
