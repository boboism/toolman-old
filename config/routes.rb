Toolman::Application.routes.draw do

  resources :product_lines
  resources :engine_models

  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users do
    root :to => 'devise/sessions#new'
  end

  resources :users, :only => [:show, :index]
  devise_for :users, :controllers => { :registrations => 'registrations' }
  
end
