Toolman::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users do
    root :to => 'devise/sessions#new'
  end

  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users, :only => [:show, :index]
end
