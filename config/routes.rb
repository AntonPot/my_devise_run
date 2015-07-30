Rails.application.routes.draw do
  devise_for :users
  # root 'sessions#index'
  devise_scope :user do
    root "devise/sessions#index"
  end

end
