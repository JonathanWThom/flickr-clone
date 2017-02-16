Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root :to => 'home#index'

  resources :users do
    resources :photos
  end

  resources :users do
    resources :tags
  end

  resources :users, :only => [] do
    resources :favorites, :only => [:index]
  end


  resources :photos do
    resources :comments
  end
end
