Rails.application.routes.draw do

  root "surveys#index"

  # get 'surveys/index'
  # get 'surveys/show'

  resources :surveys

  devise_for :users
  # root 'sessions#index'
  # devise_scope :user do
  #   root "devise/sessions#index"
  # end

end
