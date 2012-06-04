Toolman::Application.routes.draw do


  resources :service_stock_orders, :except => [:new] do
    collection do
      get :new_in
      get :new_out
    end
  end

  resources :barcode_generators

  resources :tool_cards

  resources :quality_categories

  resources :quality_deviation_reports do
    member do
      put :confirm
    end
  end

  resources :scrap_orders do
  resources :items, :controller => :scrap_order_items
    member do
      put :confirm
    end
  end

  resources :scrap_types

  resources :tunning_work_orders do
    member do
      put :confirm
    end
    # resources :setting_items, :controller => :tunning_work_order_setting_items
    # resources :sharpen_items, :controller => :tunning_work_order_sharpen_items
  end

  resources :sharpen_devices

  resources :setting_types

  resources :setting_devices

  resources :assembly_tools do
    member do
      put :confirm
    end
    resources :items, :controller => :assembly_tool_items
    resources :tunning_work_orders
  end

  resources :tool_materials do
    member do
      get :print
    end
    resources :serving_parts do
      collection do 
        post :mass_create
        post :print
      end
    end
  end

  resources :agencies

  resources :manufacturers

  resources :sub_categories

  resources :workshop_processes

  resources :product_lines

  resources :engine_models
  
  resources :categories
  
  resources :facility_types
  
  resources :facility_codes

##############################################
  authenticated :user do
    root :to => 'home#index'
  end

  devise_for :users do
    root :to => 'devise/sessions#new'
  end
  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :users, :only => [:show, :index]
##############################################

end
