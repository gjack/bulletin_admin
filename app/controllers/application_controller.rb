class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_organization
    return nil unless user_signed_in?
    @current_organization ||= current_user.organization
  end
  helper_method :current_organization

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        organization_attributes: [:id, :name]
      )
    end
  end
end
