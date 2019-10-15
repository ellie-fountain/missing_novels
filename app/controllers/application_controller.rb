class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?
	 before_action :set_search
  PER = 20

 def set_search
  @q = Review.page(params[:page]).per(PER).ransack(params[:q])
 end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:profile_image])

  end
end
