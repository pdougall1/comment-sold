Rails.application.routes.draw do
  get 'inventory/index'
  resources :products
  resources :inventories
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
