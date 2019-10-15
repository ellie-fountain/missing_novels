class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?
 #def set_search
  #@search = Review.ransack(params[:q]) #ransackメソッド推奨
  #@search_reviews = @search.result.page(params[:page])
 #end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:log_in, keys: [:name])

  end
end
