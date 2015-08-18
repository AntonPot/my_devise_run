Rails.application.routes.draw do
  root "surveys#index"
  resources :surveys
  devise_for :users
end
