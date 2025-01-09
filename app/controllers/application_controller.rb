class ApplicationController < ActionController::Base
  # Redirect users after signing in
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path # Redirect admins to their dashboard
    else
      user_dashboard_path # Redirect to the user dashboard after sign-in
      # root_path # Redirect regular users to the home page
    end
  end

  # Ensure additional parameters are permitted for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Helper method to check if the user is an admin
  helper_method :admin?

  def admin?
    current_user&.admin?
  end

  # Restrict access to admin-only routes
  def authenticate_admin!
    redirect_to root_path, alert: "You are not authorized to access this page." unless admin?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
