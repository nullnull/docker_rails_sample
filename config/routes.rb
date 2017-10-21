Rails.application.routes.draw do
  resources :users
  root 'root#index'
end
