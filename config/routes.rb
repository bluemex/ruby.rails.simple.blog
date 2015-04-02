Rails.application.routes.draw do
  devise_config = ActiveAdmin::Devise.config
  devise_config[:controllers][:omniauth_callbacks] = "omniauth_callbacks"
  devise_for :admin_users, devise_config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :articles do
    resources :comments
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'articles#index'

  # Example of regular route:
  get 'index' => 'articles#index'
end
