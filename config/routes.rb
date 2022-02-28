Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
  end
  
  resources :items do
  resources :orders, only: [:index, :create]
  resources :cards, only: [:new, :create]
  end

  
end
