class ApplicationController < ActionController::Base
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    render json: { message: 'Record not found' }, status: :not_found
  end

  rescue_from ActionController::RedirectBackError do |_exception|
    redirect_to root_path
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to new_user_path unless current_user
  end
end
