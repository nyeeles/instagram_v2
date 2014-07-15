Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root 'posts#index'
  resources :orders

  resources :posts do
  	resources :charges
    resource :map
  end
end