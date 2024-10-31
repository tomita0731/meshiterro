class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end
  
private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end
  
  protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
   end
  
   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password) }
   end

end