Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root 'posts#index'
  resources :orders

  resources :posts do
    resource :map
  end
end