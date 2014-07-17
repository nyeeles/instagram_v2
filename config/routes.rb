Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admins
  root 'posts#index'
  resources :orders

  resources :posts do
  	resources :charges
    resource :map
    resources :likes
  end

end