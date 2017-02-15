Rails.application.routes.draw do
  devise_for :users
  root :to => 'photos#index'

  resources :users do
    resources :photos
  end

  resources :users do
    resources :tags
  end

  resources :photos do

  end
end
