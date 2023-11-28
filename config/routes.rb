Rails.application.routes.draw do
  root 'users#index'
  resources :users, :posts, only: [:index, :show]
end
