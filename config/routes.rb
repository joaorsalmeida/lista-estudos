Rails.application.routes.draw do
  root to: 'pages#home'
  resources :study_items, only: [:new, :create]
end
