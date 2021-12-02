Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :study_items, only: [:new, :create]
end
