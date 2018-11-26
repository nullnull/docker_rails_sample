Rails.application.routes.draw do
  apipie
  resources :users
  root 'root#index'
end
