class RegistrationsController < Devise::RegistractionsController
  protected

  def after_inactive_sign_up_path_for(resource)
    render 'home#index'
  end
      
  def after_sign_up_path_for(resource)
    render 'home#index'
  end
end

