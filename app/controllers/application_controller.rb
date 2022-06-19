class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

     private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:school_name,
      :address,:teacher_name,:telephone_number,:school_content,:image])
  end
end
