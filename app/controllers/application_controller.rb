# Controller created by the Rails framework from which all other controllers inherit.
class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_sidebar

  # Sets the user type variable which will be used later to determine the content of the sidebar
  def load_sidebar
    if current_user.nil?
      @user_type = "not login"
    else
      @user_type = current_user.role
    end
  end

  # Handles the exception the CanCan gem generates when an unauthorized access is attempted.
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
