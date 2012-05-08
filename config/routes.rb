Toolman::Application.routes.draw do

  resources :assembly_tools

  resources :tool_materials

  resources :agencies

  resources :manufacturers

  resources :sub_categories

  resources :workshop_processes

  resources :product_lines
  resources :engine_models
  resources :categories
  resources :facility_types
  resources :facility_codes

  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users do
    root :to => 'devise/sessions#new'
  end

  resources :users, :only => [:show, :index]
  devise_for :users, :controllers => { :registrations => 'registrations' }
  
end
