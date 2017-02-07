Rails.application.routes.draw do
  resources :advertisements
  root to: 'advertisements#index'
  devise_for :users
  resources :users
end
